import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_page_state.dart';
part 'generated/user_page_cubit.freezed.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit(
      {required this.authRepository,
      required this.rankingRepository,
      required this.storageRepository})
      : super(const UserPageState(
            uploadedImageUrl: null,
            errorMessage: null,
            profile: [],
            status: Status.initial));
  final AuthRepository authRepository;
  final RankingRepository rankingRepository;
  final StorageRepository storageRepository;
  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email, required String userId}) async {
    emit(const UserPageState(
        uploadedImageUrl: null,
        errorMessage: null,
        profile: [],
        status: Status.loading));
    final uploadedImages = await storageRepository.getImages();
    final uploadedImageUrl = uploadedImages == null
        ? null
        : await uploadedImages[0].getDownloadURL();

    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email,).listen((event) {
      try {
        print("WIDGET $uploadedImageUrl");
        emit(UserPageState(
            uploadedImageUrl: uploadedImageUrl,
            errorMessage: null,
            profile: event,
            status: Status.success));
      } catch (error) {
        emit(UserPageState(
            uploadedImageUrl: null,
            errorMessage: error.toString(),
            profile: [],
            status: Status.error));
      }
    });
  }

  Future<void> updateProfile(
      {required String imageUrl,
      required String docId,
      required String nickName}) async {
    await rankingRepository.updateProfile(
      nickName: nickName,
      imageUrl: imageUrl,
      docId: docId,
    );
    print("UPDATE");
  }

 

  Future<void> uploadImage({required File? file}) async {
    if (file == null) {
      return;
    } else {
      return storageRepository.uploadImage(file: file);
    }
  }

  Future<void> signOut() async {
    return authRepository.signOut();
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
