import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  Future<void> login(String username, String password) async {
    emit(AuthState.loading());

    if (username == 'user' && password == 'password') {
      emit(AuthState.authenticated(username));
    } else {
      emit(AuthState.error('Invalid username or password'));
    }
  }

  void logout() {
    emit(AuthState.unauthenticated());
  }
}
