import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'set_up_user_state.dart';
part 'generated/set_up_user_cubit.freezed.dart';

class SetUpUserCubit extends Cubit<SetUpUserState> {
  SetUpUserCubit(
      {required this.rankingRepository, required this.storageRepository})
      : super(const SetUpUserState(
            errorMessage: null,
            profile: [],
            status: Status.initial,
            uploadImageUrl: null));
  final RankingRepository rankingRepository;
  final StorageRepository storageRepository;

  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    emit(const SetUpUserState(
        uploadImageUrl: null,
        errorMessage: null,
        profile: [],
        status: Status.loading));
    final uploadedImages = await storageRepository.getImages();

    final uploadedImageUrl = uploadedImages == null
        ? null
        : await uploadedImages[0].getDownloadURL();
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        print("success");
        emit(SetUpUserState(
            uploadImageUrl: uploadedImageUrl,
            errorMessage: null,
            profile: event,
            status: Status.success));
      } catch (error) {
        emit(SetUpUserState(
            uploadImageUrl: null,
            errorMessage: error.toString(),
            profile: [],
            status: Status.error));
      }
    });
  }

  Future<void> addProfileToGlobalRanking(
      {required String nickName,
      required String email,
      required String? imageUrl}) async {
    await rankingRepository.addProfileToGlobal(
        nickName: nickName, email: email, imageUrl: imageUrl);
  }

  Future<void> uploadImage({required File file}) async {
    await storageRepository.uploadImage(file: file);
    print("Dupa");
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
