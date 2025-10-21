import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.logout, color: color_constants.mainText),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 16, color: color_constants.mainText),
            ),
            onTap: () {
              context.read<AuthCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
