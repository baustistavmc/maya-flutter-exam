import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/config/themes.dart';
import 'package:maya_flutter_exam/data/data_resources/transaction_data_resource.dart';
import 'package:maya_flutter_exam/domain/repositories/transaction_repository_impl.dart';
import 'package:maya_flutter_exam/domain/use_cases/get_transaction_list.dart';
import 'package:maya_flutter_exam/domain/use_cases/send_money.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/send_money_cubit/send_money_cubit.dart';
import 'package:maya_flutter_exam/presentation/screens/auth_screen.dart';
import 'package:maya_flutter_exam/presentation/screens/send_money_screen.dart';
import 'package:maya_flutter_exam/presentation/screens/transaction_list_screen.dart';
import 'package:maya_flutter_exam/presentation/screens/wallet_screen.dart';

void main() {
  runApp(const SendMoneyApp());
}

class SendMoneyApp extends StatelessWidget {
  const SendMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),

        BlocProvider<SendMoneyCubit>(
          create: (_) {
            final dataSource = TransactionRemoteDataSource();
            final repository = TransactionRepositoryImpl(
              remoteDataSource: dataSource,
            );
            final useCase = SendMoneyUseCase(repository);
            return SendMoneyCubit(useCase);
          },
        ),

        BlocProvider<TransactionListCubit>(
          create: (_) {
            final dataSource = TransactionRemoteDataSource();
            final repository = TransactionRepositoryImpl(
              remoteDataSource: dataSource,
            );

            final useCase = GetTransactionListUseCase(repository);
            return TransactionListCubit(useCase: useCase);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Send Money App',
        theme: AppTheme(context: context).themeData,
        initialRoute: '/login',
        routes: {
          '/login': (_) => const AuthScreen(),
          '/wallet': (_) => const WalletScreen(),
          '/send': (_) => const SendMoneyScreen(),
          '/transactionHistory': (_) => TransactionListScreen(),
        },
      ),
    );
  }
}
