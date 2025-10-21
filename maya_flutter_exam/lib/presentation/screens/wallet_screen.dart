import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:maya_flutter_exam/presentation/screens/auth_screen.dart';
import 'package:maya_flutter_exam/presentation/screens/send_money_screen.dart';
import 'package:maya_flutter_exam/presentation/screens/transaction_list_screen.dart';
import 'package:maya_flutter_exam/widgets/drawer_widget.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const WalletHomeContent(),
    const TransactionListScreen(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        selectedItemColor: const Color(0xFF00b464),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history_outlined),
            label: 'Transactions',
          ),
        ],
      ),
    );
  }
}

class WalletHomeContent extends StatefulWidget {
  const WalletHomeContent({super.key});

  @override
  State<WalletHomeContent> createState() => _WalletHomeContentState();
}

class _WalletHomeContentState extends State<WalletHomeContent> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AuthScreen()),
            );
          },
        );
      },
      child: Scaffold(
        endDrawer: DrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 36.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================ Greeting Text & Balance Card ================ //
                Text(
                  'Hi there, User!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color_constants.mainText,
                  ),
                ),
                const SizedBox(height: 16),

                // ================  Balance Card ================ //
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ================ Balance Label & Visibility Toggle ================ //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Balance',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: color_constants.mainText),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isBalanceVisible = !_isBalanceVisible;
                                });
                              },
                              child: Icon(
                                _isBalanceVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: color_constants.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // ================ Balance Amount ================ //
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                            children: [
                              TextSpan(
                                text: '₱ ',
                                style: const TextStyle(
                                  fontSize: 28,
                                  color: color_constants.mainText,
                                ),
                              ),
                              if (_isBalanceVisible)
                                const TextSpan(text: '500.00')
                              else
                                const TextSpan(text: '•••••••••'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // ================ Send Money Button ================ //
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xFF00b464),
                              ),

                              shape:
                                  WidgetStateProperty.resolveWith<
                                    RoundedRectangleBorder
                                  >((_) {
                                    return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    );
                                  }),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SendMoneyScreen();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.currency_exchange,
                                  color: color_constants.background,
                                ),

                                SizedBox(width: 8),
                                Text(
                                  'Send',
                                  style: TextStyle(
                                    color: color_constants.background,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
