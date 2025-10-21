import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(msg ?? 'Login failed')));
            },
            authenticated: (username) =>
                Navigator.pushReplacementNamed(context, '/wallet'),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthStateLoading;
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            color_constants.primary,
                          ),
                          shape:
                              WidgetStateProperty.resolveWith<
                                RoundedRectangleBorder
                              >((Set<WidgetState> states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                );
                              }),
                        ),
                        onPressed: isLoading
                            ? null
                            : () async {
                                await context.read<AuthCubit>().login(
                                  _usernameController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: color_constants.primary,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  color: color_constants.background,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
