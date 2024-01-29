import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDataSource {
  Stream<User?> authStateChagnes() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<void> signInWitEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

    Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}