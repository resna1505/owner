import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/sign_in_form_model.dart';
import 'package:kampus/models/user_model.dart';
import 'package:kampus/services/auth_service.dart';
import 'package:kampus/services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Pisahkan setiap event handler
    on<AuthLogin>(_onAuthLogin);
    on<AuthGetCurrentUser>(_onAuthGetCurrentUser);
    on<AuthUpadatePassword>(_onAuthUpdatePassword);
    on<AuthLogout>(_onAuthLogout);
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final user = await AuthService().login(event.data);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> _onAuthGetCurrentUser(
      AuthGetCurrentUser event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final SignInFormModel data = await AuthService().getCredentialFromLocal();
      final UserModel user = await AuthService().login(data);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> _onAuthUpdatePassword(
      AuthUpadatePassword event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      final successMessage = await UserService().updatePassword(
        event.oldPassword,
        event.newPassword,
      );

      emit(AuthPasswordUpdateSuccess(successMessage)); // Pakai message dari API
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  // Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
  //   try {
  //     emit(AuthLoading());
  //     await AuthService().logout();
  //     emit(AuthLogoutSuccess()); // atau tetap AuthInitial kalau mau
  //   } catch (e) {
  //     emit(AuthFailed(e.toString()));
  //   }
  // }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await AuthService().logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
