import 'dart:io';

import 'package:brain_check/data_sources/storage_data_source.dart';
import 'package:brain_check/domain/repositories/storage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageDataSource extends Mock implements StorageDataSource {}

void main() {
  late StorageRepository sut;
  late MockStorageDataSource dataSource;

  setUp(() {
    dataSource = MockStorageDataSource();

    sut = StorageRepository(storageDataSource: dataSource);
  });

  group("uploadImage", () {
    test("should call duelGameDataSource.uploadImage() method once", () async {
      when(
        () => dataSource.uploadImage(File("path")),
      ).thenAnswer((_) async => []);

      await sut.uploadImage(file: File("path"));

      verify(
        () => dataSource.uploadImage(File("path")),
      ).called(1);
    });
  });
  group("updateImage", () {
    test("should call duelGameDataSource.update() method once", () async {
      when(
        () => dataSource.uploadImage(File("path")),
      ).thenAnswer((_) async => Future<void>.value(null));

      await sut.updateImage(file: File("path"));

      verify(
        () => dataSource.uploadImage(File("path")),
      ).called(1);
    });
  });
}
