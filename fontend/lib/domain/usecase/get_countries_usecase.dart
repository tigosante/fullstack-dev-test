import 'package:either_dart/either.dart';
import 'package:fullstack_dev_test/data/repository/repository.dart';
import 'package:fullstack_dev_test/domain/entities/entities.dart';
import 'package:fullstack_dev_test/exceptions/exceptions.dart';

mixin GetContriesUsecase {
  Future<Either<BaseException, List<CountryEntity>>> call();
}

class GetContriesUsecaseImpl implements GetContriesUsecase {
  GetContriesUsecaseImpl({
    required DataRepository repository,
  }) : _repository = repository;

  final DataRepository _repository;

  @override
  Future<Either<BaseException, List<CountryEntity>>> call() async {
    return _repository.getCountries(limit: 25);
  }
}
