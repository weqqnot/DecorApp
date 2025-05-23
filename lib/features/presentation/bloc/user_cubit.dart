import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_dto.dart';
import '../../data/repositories/user_service.dart';

class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserDto user;
  const UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> fetchUser() async {
    emit(UserLoading());
    try {
      final user = await UserService.getProfile(); // Gọi API backend
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Không thể tải thông tin người dùng"));
    }
  }

  Future<void> updateUser(UserDto updatedUser) async {
    emit(UserLoading());
    try {
      await UserService.updateProfile(updatedUser); // Gửi yêu cầu cập nhật
      emit(UserLoaded(updatedUser));
    } catch (e) {
      emit(UserError("Cập nhật thất bại"));
    }
  }
}
