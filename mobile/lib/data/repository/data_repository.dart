import 'package:either_dart/either.dart';
import 'package:fullstack_dev_test/data/datasource/datasource.dart';
import 'package:fullstack_dev_test/data/dto/dto.dart';
import 'package:fullstack_dev_test/exceptions/exceptions.dart';

mixin DataRepository {
  Future<Either<BaseException, List<CountryDTO>>> getCountries(
      {required int limit});

  Future<Either<BaseException, List<CityDTO>>> getCities(
      {required String countryName});

  Future<Either<BaseException, CityDetailsDTO>> getCityDetails({
    required String city,
    required String country,
    required String subCountry,
  });
}

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl({
    required GeminiDataSource geminiDataSource,
    required FirestoreDataSource firestoreDataSource,
  })  : _geminiDataSource = geminiDataSource,
        _firestoreDataSource = firestoreDataSource;

  final GeminiDataSource _geminiDataSource;
  final FirestoreDataSource _firestoreDataSource;

  @override
  Future<Either<BaseException, List<CountryDTO>>> getCountries(
      {required int limit}) async {
    try {
      final data = await _firestoreDataSource.getCountries(limit: limit);
      if (data.isEmpty) {
        return Left(NotFoundException(codeSuffix: 'country'));
      }
      return Right(
          data.map((countryName) => CountryDTO(name: countryName)).toList());
    } on BaseException catch (baseException) {
      return Left(baseException);
    } on Exception {
      return Left(PlatformException());
    }
  }

  @override
  Future<Either<BaseException, List<CityDTO>>> getCities(
      {required String countryName}) async {
    try {
      final data =
          await _firestoreDataSource.getCities(countryName: countryName);
      if (data.isEmpty) {
        return Left(NotFoundException(codeSuffix: 'cities'));
      }
      return Right(data.map(CityDTO.fromJson).toList());
    } on BaseException catch (baseException) {
      return Left(baseException);
    } on Exception {
      return Left(PlatformException());
    }
  }

  @override
  Future<Either<BaseException, CityDetailsDTO>> getCityDetails({
    required String city,
    required String country,
    required String subCountry,
  }) async {
    try {
      final data = await _geminiDataSource.getCityDetails(
        city: city,
        country: country,
        subCountry: subCountry,
      );
      if (data.isEmpty) {
        return Left(NotFoundException(codeSuffix: 'city_details'));
      }

      return Right(CityDetailsDTO.fromJson(data));
    } on BaseException catch (baseException) {
      return Left(baseException);
    } on Exception {
      return Left(PlatformException());
    }
  }
}
