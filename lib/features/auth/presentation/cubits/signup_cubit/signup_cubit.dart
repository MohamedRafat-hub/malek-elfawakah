import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignupLoading());

     var result =  await authRepo.createUserWithEmailAndPassword(
          name: name, email: email, password: password);
     result.fold((failure){
       emit(SignupFailure(message: failure.message));
     }, (userEntity){
       emit(SignupSuccess(userEntity));
     });
  }
}
