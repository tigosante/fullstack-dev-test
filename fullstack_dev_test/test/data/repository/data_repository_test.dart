import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_dev_test/data/dto/dto.dart'
    show CityDTO, CityDetailsDTO, CountryDTO;
import 'package:fullstack_dev_test/data/repository/data_repository.dart';
import 'package:fullstack_dev_test/exceptions/exceptions.dart'
    show BaseException, NotFoundException, PlatformException;
import 'package:mockito/mockito.dart';

import '../datasource/firestore_datasource_mock.dart';
import '../datasource/gemini_datasource_mock.dart';

void main() {
  final geminiDataSource = MockGeminiDataSource();
  final firestoreDataSource = MockFirestoreDataSource();
  final repository = DataRepositoryImpl(
    geminiDataSource: geminiDataSource,
    firestoreDataSource: firestoreDataSource,
  );

  group(
    'DataRepository >',
    () {
      const limit = 2;
      group('getCountries - SUCCESS', () {
        final countries = ['Brazil', 'Canadá'];
        when(firestoreDataSource.getCountries(limit: limit))
            .thenAnswer((_) async => countries);

        test(
          'should return a Either<BaseException, List<CountryDTO>>',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result, isA<Either<BaseException, List<CountryDTO>>>());
          },
        );
        test(
          'should return a right result',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.isRight, equals(true));
          },
        );
        test(
          'should return a list of countries',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.right, isA<List<CountryDTO>>());
          },
        );
        test(
          'should return a list of countries with length 2',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.right.length, 2);
          },
        );
        test(
          'should return a list of countries with name Brazil',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.right.firstWhere((e) => e.name == 'Brazil').name,
                equals('Brazil'));
          },
        );
      });
      group('getCountries - FAIL', () {
        const limit = 2;
        final countries = <String>[];
        when(firestoreDataSource.getCountries(limit: limit))
            .thenAnswer((_) async => countries);
        test(
          'should return a left result',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.isLeft, equals(true));
          },
        );
        test(
          'should return a NotFoundException()',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.left, isA<NotFoundException>());
          },
        );
        test(
          'should return a NotFoundException with code "not_found_country"',
          () async {
            final result = await repository.getCountries(limit: limit);
            expect(result.left.code, equals('not_found_country'));
          },
        );
        test(
          'should return a PlatformException',
          () async {
            when(firestoreDataSource.getCountries(limit: limit))
                .thenThrow(Exception());
            final result = await repository.getCountries(limit: limit);
            expect(result.left, isA<PlatformException>());
          },
        );
      });
      group('getCities - SUCCESS', () {
        const countryName = 'Brazil';
        final cities = <Map<String, dynamic>>[
          {'city': "Brasília", "subcountry": "DF"},
        ];
        when(firestoreDataSource.getCities(countryName: countryName))
            .thenAnswer((_) async => cities);
        test(
          'should return a Either<BaseException, List<CityDTO>>',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result, isA<Either<BaseException, List<CityDTO>>>());
          },
        );
        test(
          'should return a right result',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.isRight, equals(true));
          },
        );
        test(
          'should return a list of cities',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.right, isA<List<CityDTO>>());
          },
        );
        test(
          'should return a list of cities with length 1',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.right.length, equals(1));
          },
        );
        test(
          'should return a list of cities with name Brazil',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(
              result.right.firstWhere((e) => e.name == 'Brazil').name,
              equals('Brazil'),
            );
          },
        );
      });
      group('getCities - FAIL', () {
        const countryName = 'Brazil';
        final cities = <Map<String, dynamic>>[];
        when(firestoreDataSource.getCities(countryName: countryName))
            .thenAnswer((_) async => cities);
        test(
          'should return a left result',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.isLeft, equals(true));
          },
        );
        test(
          'should return a NotFoundException()',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.left, isA<NotFoundException>());
          },
        );
        test(
          'should return a NotFoundException with code "not_found_cities"',
          () async {
            final result = await repository.getCities(countryName: countryName);
            expect(result.left.code, equals('not_found_cities'));
          },
        );
        test(
          'should return a PlatformException',
          () async {
            when(firestoreDataSource.getCities(countryName: countryName))
                .thenThrow(Exception());
            final result = await repository.getCountries(limit: limit);
            expect(result.left, isA<PlatformException>());
          },
        );
      });
      group('getCityDetails - SUCCESS', () {
        const cityName = 'Brasília';
        const subCountryName = 'DF';
        const countryName = 'Brazil';
        final cityDetails = {
          "title": 'Brasília',
          "topics": [
            {"title": "Capital", "description": "Capital do Brasil"},
          ]
        };
        when(geminiDataSource.getCityDetails(
          city: cityName,
          country: countryName,
          subCountry: subCountryName,
        )).thenAnswer((_) async => cityDetails);
        test(
          'should return a Either<BaseException, List<CityDetailsDTO>>',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result, isA<Either<BaseException, List<CityDetailsDTO>>>());
          },
        );
        test(
          'should return a right result',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.isRight, equals(true));
          },
        );
        test(
          'should return a city details data',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.right, isA<List<CityDetailsDTO>>());
          },
        );
        test(
          'should return a city details data with 1 topic',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.right.topics.length, equals(1));
          },
        );
      });
      group('getCityDetails - FAIL', () {
        const cityName = 'Brasília';
        const subCountryName = 'DF';
        const countryName = 'Brazil';
        final cityDetails = <String, dynamic>{};
        when(geminiDataSource.getCityDetails(
          city: cityName,
          country: countryName,
          subCountry: subCountryName,
        )).thenAnswer((_) async => cityDetails);
        test(
          'should return a left result',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.isLeft, equals(true));
          },
        );
        test(
          'should return a NotFoundException()',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.left, isA<NotFoundException>());
          },
        );
        test(
          'should return a NotFoundException with code "not_found_city_details"',
          () async {
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );

            expect(result.left.code, equals('not_found_city_details'));
          },
        );
        test(
          'should return a PlatformException',
          () async {
            when(geminiDataSource.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            )).thenThrow(Exception());
            final result = await repository.getCityDetails(
              city: cityName,
              country: countryName,
              subCountry: subCountryName,
            );
            expect(result.left, isA<PlatformException>());
          },
        );
      });
    },
  );
}
