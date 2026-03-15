import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold((failure) => emit(LoginFailure(failure.message.toString())),
        (user) => emit(LoginSuccess()));
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithGoogle();

    return result.fold((failure) => emit(LoginFailure(failure.message)),
        (userEntity) => emit(LoginSuccess()));
  }


  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithFacebook();
    return result.fold((failure) => emit(LoginFailure(failure.message)),
            (userEntity) => emit(LoginSuccess()));
  }
}
