import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const SendMoneyApp());
}

class SendMoneyApp extends StatelessWidget {
  const SendMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<AuthCubit>(
        //   create: (_) => AuthCubit(),
        // ),
        // BlocProvider<WalletCubit>(
        //   create: (_) => WalletCubit(),
        // ),
        // BlocProvider<SendMoneyCubit>(
        //   create: (context) => SendMoneyCubit(
        //     walletCubit: context.read<WalletCubit>(),
        //   ),
        // ),
        // BlocProvider<TransactionsCubit>(
        //   create: (_) => TransactionsCubit(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Send Money App',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
        initialRoute: '/login',
        routes: {
          // '/login': (_) => const LoginScreen(),
          // '/wallet': (_) => const WalletScreen(),
          // '/send': (_) => const SendScreen(),
          // '/transactions': (_) => const TransactionsScreen(),
        },
      ),
    );
  }
}
