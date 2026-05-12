import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/image_repo.dart';
import 'package:meta/meta.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit({required this.imageRepo}) : super(UploadImageInitial());
  final ImageRepo imageRepo;
  uploadImage({required String path ,required String fileName})async {
    emit(UploadImageLoading());
    var result =await imageRepo.uploadImage(path, fileName);
    result.fold((error){
      emit(UploadImageFailure(error.message));
    }, (success){
      emit(UploadImageSuccess(success));
    });
  }
}
