import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_dto.dart';
import '../../data/repositories/auth_repository.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> register(UserDto user) async {
    emit(AuthLoading());
    try {
      await authRepository.register(user);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
