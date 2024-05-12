import 'package:either_dart/either.dart' show Either;
import 'package:fullstack_dev_test/data/repository/repository.dart'
    show DataRepository;
import 'package:fullstack_dev_test/domain/entities/entities.dart'
    show CityDetailsEntity;
import 'package:fullstack_dev_test/exceptions/exceptions.dart'
    show BaseException;

mixin GetCityDeatilsUsecase {
  Future<Either<BaseException, CityDetailsEntity>> call({
    required String city,
    required String country,
    required String subCountry,
  });
}

class GetCityDeatilsUsecaseImpl implements GetCityDeatilsUsecase {
  GetCityDeatilsUsecaseImpl({
    required DataRepository repository,
  }) : _repository = repository;

  final DataRepository _repository;

  @override
  Future<Either<BaseException, CityDetailsEntity>> call({
    required String city,
    required String country,
    required String subCountry,
  }) async {
    return _repository.getCityDetails(
      city: city,
      country: country,
      subCountry: subCountry,
    );
  }
}
