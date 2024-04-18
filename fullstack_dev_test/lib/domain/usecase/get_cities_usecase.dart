import 'package:either_dart/either.dart';
import 'package:fullstack_dev_test/data/repository/repository.dart';
import 'package:fullstack_dev_test/domain/entities/entities.dart';
import 'package:fullstack_dev_test/exceptions/exceptions.dart';

mixin GetCitiesUsecase {
  Future<Either<BaseException, List<CityEntity>>> call(
      {required String countryName});
}

class GetCitiesUsecaseImpl implements GetCitiesUsecase {
  GetCitiesUsecaseImpl({
    required DataRepository repository,
  }) : _repository = repository;

  final DataRepository _repository;

  @override
  Future<Either<BaseException, List<CityEntity>>> call(
      {required String countryName}) async {
    return _repository.getCities(countryName: countryName);
  }
}
