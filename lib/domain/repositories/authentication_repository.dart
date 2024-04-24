import 'package:brain_check/data_sources/authentication_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});
  Stream<User?> authStateChanges() {
    return authDataSource.authStateChagnes();
  }

  Future<void> signInWitEmailAndPassword(
      {required String email, required String password}) async {
    await authDataSource.signInWitEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password, }) async {
    await authDataSource.createUserWithEmailAndPassword(
        email: email, password: password, );
  }

  Future<void> signOut() async {
    await authDataSource.signOut();
  }
}