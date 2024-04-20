import 'dart:io';

import 'package:brain_check/data_sources/storage_data_source.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  StorageRepository({required this.storageDataSource});
  final StorageDataSource storageDataSource;

  Future<void> uploadImage({required File file}) async {
    await storageDataSource.uploadImage(file);
  }

  Future<List<Reference>?> getImages() async {
    final list = await storageDataSource.getImages();
    if (list!.isEmpty) {
      return null;
    } else {
      return list;
    }
  }
}
