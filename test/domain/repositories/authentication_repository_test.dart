import 'package:brain_check/data_sources/authentication_data_source.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

void main() {
  late AuthRepository sut;
  late MockAuthDataSource dataSource;

  setUp(() {
    dataSource = MockAuthDataSource();
    sut = AuthRepository(authDataSource: dataSource);
  });

  group("SignInWithEmailAndPassword", () {
    test("should call authDataSource.signInWitEmailAndPassword() method once",
        () async {
      when(
        () => dataSource.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.signInWitEmailAndPassword(email: "email", password: "password");

      verify(
        () => dataSource.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
  group("CreateUserWithEmailAndPassword", () {
    test(
        "should call authDataSource.CreateUserWitEmailAndPassword() method once",
        () async {
      when(
        () => dataSource.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.createUserWithEmailAndPassword(
          email: "email", password: "password");

      verify(
        () => dataSource.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
  group("signOut", () {
    test("should call authDataSource.signOut() method once", () async {
      when(
        () => dataSource.signOut(),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.signOut();

      verify(
        () => dataSource.signOut(),
      ).called(1);
    });
  });
  group("updateDispalyName", () {
    test("should call authDataSource.updateDisplayName() method once",
        () async {
      when(
        () => dataSource.updateDisplayName(email: "email"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.updateDisplayName(email: "email");

      verify(
        () => dataSource.updateDisplayName(email: "email"),
      ).called(1);
    });
  });
}
