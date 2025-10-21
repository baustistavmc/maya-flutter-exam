import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/auth_cubit/auth_state.dart';

void main() {
  late AuthCubit authCubit;

  setUp(() {
    authCubit = AuthCubit();
  });

  tearDown(() {
    authCubit.close();
  });

  test('initial state should be AuthState.initial()', () {
    expect(authCubit.state, AuthState.initial());
  });

  blocTest<AuthCubit, AuthState>(
    'emits [loading, authenticated] when login is successful',
    build: () => authCubit,
    act: (cubit) => cubit.login('user', 'password'),
    expect: () => [AuthState.loading(), AuthState.authenticated('user')],
  );

  blocTest<AuthCubit, AuthState>(
    'emits [loading, error] when login fails',
    build: () => authCubit,
    act: (cubit) => cubit.login('test', 'password'),
    expect: () => [
      AuthState.loading(),
      AuthState.error('Invalid username or password'),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'emits [unauthenticated] when logout is called',
    build: () => authCubit,
    act: (cubit) => cubit.logout(),
    expect: () => [AuthState.unauthenticated()],
  );
}
