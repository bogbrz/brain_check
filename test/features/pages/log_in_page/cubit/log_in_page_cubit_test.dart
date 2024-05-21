import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LogInPageCubit sut;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();

    sut = LogInPageCubit(authRepository: repository);
  });
  group("signInWitEmailAndPassword", () {
    test("should call authRepository.signInWitEmailAndPassword once", () async {
      when(
        () => repository.signInWitEmailAndPassword(email: "1", password: "1"),
      ).thenAnswer((_) async => []);
      await sut.signInWitEmailAndPassword(email: "1", password: "1");

      verify(
        () => repository.signInWitEmailAndPassword(email: "1", password: "1"),
      ).called(1);
    });
  });
  group("createUserWithEmailAndPassword", () {
    test("should call authRepository.createUserWithEmailAndPassword once",
        () async {
      when(
        () => repository.createUserWithEmailAndPassword(
            email: "1", password: "1"),
      ).thenAnswer((_) async => []);
      await sut.createUserWithEmailAndPassword(email: "1", password: "1");

      verify(
        () => repository.createUserWithEmailAndPassword(
            email: "1", password: "1"),
      ).called(1);
    });
  });
  group("updateDisplayName", () {
    test("should call authRepository.updateDisplayName once", () async {
      when(
        () => repository.updateDisplayName(
          email: "1",
        ),
      ).thenAnswer((_) async => []);
      await sut.updateDisplayName(
        email: "1",
      );

      verify(
        () => repository.updateDisplayName(
          email: "1",
        ),
      ).called(1);
    });
  });
}
