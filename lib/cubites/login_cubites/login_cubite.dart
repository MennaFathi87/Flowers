import 'package:flowerss/cubites/login_cubites/login_state.dart';
import 'package:flowerss/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService = AuthService();

  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await _authService.login(email, password);
      emit(LoginSuccess(user!));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
