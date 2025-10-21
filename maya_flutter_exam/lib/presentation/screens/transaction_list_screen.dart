import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_state.dart';
import 'package:maya_flutter_exam/presentation/screens/auth_screen.dart';
import 'package:maya_flutter_exam/widgets/drawer_widget.dart';
import 'package:maya_flutter_exam/widgets/error_screen.dart';
import 'package:maya_flutter_exam/widgets/transaction_list_widget.dart';
import 'package:shimmer/shimmer.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  void _fetchTransactions() {
    context.read<TransactionListCubit>().fetchTransactions();
  }

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
        appBar: AppBar(title: const Text('Transaction History')),
        endDrawer: DrawerWidget(),
        body: BlocBuilder<TransactionListCubit, TransactionListState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildShimmer(),
              loading: () => _buildShimmer(),
              loaded: (transactions) =>
                  TransactionListView(transactions: transactions),
              error: (message) => ErrorScreen(
                message: 'Please try again.',
                onRetry: () {
                  context.read<TransactionListCubit>().fetchTransactions();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // ================ Shimmer Effect While Loading ================ //
  Widget _buildShimmer() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 15,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, __) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left column placeholder
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 14,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                  Container(width: 150, height: 18, color: Colors.white),
                ],
              ),

              // Right column placeholder
              Container(width: 80, height: 18, color: Colors.white),
            ],
          ),
        );
      },
    );
  }
}
