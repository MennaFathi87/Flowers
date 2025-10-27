import 'package:flowerss/cubites/register_cubites/register_state_cubite.dart';
import 'package:flowerss/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final AuthService _authService = AuthService();

  Future<void> register(String email, String password, String username) async {
    emit(RegisterLoading()); 

    try {
      final user = await _authService.register(email, password, username);
      if (user != null) {
        emit(RegisterSuccess(user)); 
      } else {
        emit(RegisterFailure("Registration failed"));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString())); 
    }
  }
}
