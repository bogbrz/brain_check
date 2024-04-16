import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_picture_state.dart';
part 'generated/profile_picture_cubit.freezed.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit({required this.storageRepository})
      : super(ProfilePictureState(errorMessage: null, uploadedImageUrl: null));
  final StorageRepository storageRepository;

  Future<void> getImages() async {
    final uploadedImages = await storageRepository.getImages();
    final uploadedImageUrl = await uploadedImages![0].getDownloadURL();
    try {
      print("UPLOADED IMAGES CUBIT ${uploadedImageUrl}");

      emit(ProfilePictureState(
          uploadedImageUrl: uploadedImageUrl , errorMessage: null));
    } catch (e) {
      emit(
          ProfilePictureState(uploadedImageUrl: null, errorMessage: e.toString()));
    }
  }
}
