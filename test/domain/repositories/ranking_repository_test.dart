
import 'package:brain_check/data_sources/ranking_data_source.dart';
import 'package:brain_check/data_sources/storage_data_source.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageDataSource extends Mock implements StorageDataSource {}

class MockRankingDataSource extends Mock implements RankingFireBaseDataSource {}

void main() {
  late RankingRepository sut;
  late MockStorageDataSource dataSource1;
  late MockRankingDataSource dataSource2;

  setUp(() {
    dataSource1 = MockStorageDataSource();
    dataSource2 = MockRankingDataSource();

    sut = RankingRepository(
        storageDataSource: dataSource1, rankingFireBaseDataSource: dataSource2);
  });

  group("restoreLifes", () {
    test("should call rankingFireBaseDataSource.restoreLifes() method once",
        () async {
      when(
        () => dataSource2.restoreLifes(
            playerId: "1", lastLogin: DateTime(1, 1, 1, 1, 1)),
      ).thenAnswer((_) async => []);

      await sut.restoreLifes(playerId: "1", lastLogin: DateTime(1, 1, 1, 1, 1));

      verify(
        () => dataSource2.restoreLifes(
            playerId: "1", lastLogin: DateTime(1, 1, 1, 1, 1)),
      ).called(1);
    });
  });
  group("setStartTime", () {
    test("should call rankingFireBaseDataSource.setStartTime() method once",
        () async {
      when(
        () => dataSource2.setStartTime(
          playerId: "1",
        ),
      ).thenAnswer((_) async => []);

      await sut.setStartTime(playerId: "1");

      verify(
        () => dataSource2.setStartTime(playerId: "1"),
      ).called(1);
    });
  });
  group("setEndTime", () {
    test("should call rankingFireBaseDataSource.setEndTime() method once",
        () async {
      when(
        () => dataSource2.setEndTime(
          playerId: "1",
        ),
      ).thenAnswer((_) async => []);

      await sut.setEndTime(playerId: "1");

      verify(
        () => dataSource2.setEndTime(playerId: "1"),
      ).called(1);
    });
  });

}
