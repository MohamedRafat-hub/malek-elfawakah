import 'dart:developer' show log;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/build_show_snack_bar.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/getProfileDataCubit/get_profile_data_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/uploadImageCubit/upload_image_cubit.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  Future<void> _pickAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final fileName = pickedFile.name;
      final path = pickedFile.path;
      if (context.mounted) {
        context.read<UploadImageCubit>().uploadImage(
          path: path,
          fileName: fileName,
          uid: FirebaseAuth.instance.currentUser!.uid,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileDataCubit, GetProfileDataState>(
      listener: (context, state) {
        if (state is GetProfileDataFailure) {
          showSnackBar(context, message: state.errorMessage, color: Colors.red);
        }
      },
      builder: (context, profileState) {
        final userEntity = profileState is GetProfileDataSuccess
            ? profileState.userEntity
            : null;

        return Row(
          children: [
            BlocConsumer<UploadImageCubit, UploadImageState>(
              listener: (context, state) {
                if (state is UploadImageFailure) {
                  log("error is ${state.errorMessage}");
                  showSnackBar(context,
                      message: state.errorMessage, color: Colors.red);
                } else if (state is UploadImageSuccess) {
                  context.read<GetProfileDataCubit>().getProfileData(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                  );
                  showSnackBar(context, message: 'تم رفع الصورة بنجاح ✅');
                }
              },
              builder: (context, uploadState) {
                if (uploadState is UploadImageLoading) {
                  return CircleAvatar(
                    radius: 45,
                    child: CircularProgressIndicator(color: Colors.green[700]
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () => _pickAndUploadImage(context),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [

                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[50],
                          border: Border.all(color: Colors.green[100]!, width: 2),
                        ),
                        child: ClipOval(
                          child: userEntity?.profileImage != null && userEntity!.profileImage!.isNotEmpty
                              ? Image.network(
                            userEntity!.profileImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => _buildDefaultAvatar(),
                          )
                              : _buildDefaultAvatar(),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Gap(10),
            Column(
              children: [
                Text(
                  userEntity?.name ?? 'جار التحميل...',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  userEntity?.email ?? '',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  Widget _buildDefaultAvatar() {
    return Icon(
      Icons.person_rounded,
      size: 50,
      color: Colors.green[300],
    );
  }
}