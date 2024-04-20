import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

final storage = FirebaseStorage.instance;

@injectable
class StorageDataSource {
  final storageRef = storage.ref();
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> uploadImage(File file) async {
    final fileName = file.path.split("/").last;
    final testName = "name";
    final testFileName = fileName.split(".").last;

    final uploadRef =
        storageRef.child("$userId/uploads/$testName.$testFileName");
    await uploadRef.putFile(file);
  }

  Future<List<Reference>?> getImages() async {
    final uploadRef = storageRef.child("$userId/uploads/");
    final uploads = await uploadRef.listAll();

    return uploads.items;
  }
}
