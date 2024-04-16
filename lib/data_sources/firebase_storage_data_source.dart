import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

class FirebaseStorageDataSource {
  final storageRef = storage.ref();
  
}
