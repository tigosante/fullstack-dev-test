import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter_gemini/flutter_gemini.dart' show Gemini;
import 'package:fullstack_dev_test/data/datasource/datasource.dart';
import 'package:fullstack_dev_test/data/datasource/firestore_datasource.dart'
    show FirestoreDataSourceImpl;
import 'package:fullstack_dev_test/data/datasource/gemini_datasource.dart'
    show GeminiDataSourceImpl;
import 'package:fullstack_dev_test/data/repository/data_repository.dart';
import 'package:fullstack_dev_test/domain/usecase/get_cities_usecase.dart';
import 'package:fullstack_dev_test/domain/usecase/get_city_details_usecase.dart';
import 'package:fullstack_dev_test/domain/usecase/get_countries_usecase.dart';
import 'package:fullstack_dev_test/extensions/extensions.dart';
import 'package:fullstack_dev_test/infra/app_env.dart' show AppEnv;
import 'package:fullstack_dev_test/infra/app_injector.dart'
    show AppInjector, AppInjectorImpl, InstanceType;
import 'package:fullstack_dev_test/infra/infra.dart'
    show DefaultFirebaseOptions, TranslateService, TranslateServiceImpl;
import 'package:fullstack_dev_test/router/app_router.dart'
    show AppRouter, AppRouterImpl;
import 'package:fullstack_dev_test/router/router.dart' show routesConfig;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:url_strategy/url_strategy.dart' show setPathUrlStrategy;

final _getItInstance = GetIt.instance;

Future<AppInjector> startAppService() async {
  setPathUrlStrategy();
  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final injector = AppInjectorImpl(provider: _getItInstance);
  injector
    ..setInstance<Gemini>(() => Gemini.init(apiKey: AppEnv.geminiApiKey))
    ..setInstance(() => FirebaseFirestore.instanceFor(app: firebaseApp))
    ..setInstance<GeminiDataSource>(
      () => GeminiDataSourceImpl(client: injector.get()),
    )
    ..setInstance<FirestoreDataSource>(
      () => FirestoreDataSourceImpl(firestore: injector.get()),
    )
    ..setInstance<DataRepository>(
      () => DataRepositoryImpl(
        geminiDataSource: injector.get(),
        firestoreDataSource: injector.get(),
      ),
    )
    ..setInstance<GetContriesUsecase>(
      () => GetContriesUsecaseImpl(repository: injector.get()),
    )
    ..setInstance<GetCitiesUsecase>(
      () => GetCitiesUsecaseImpl(repository: injector.get()),
    )
    ..setInstance<GetCityDeatilsUsecase>(
      () => GetCityDeatilsUsecaseImpl(repository: injector.get()),
    )
    ..setInstance<AppRouter>(
      AppRouterImpl.new,
      instanceType: InstanceType.singleton,
    )
    ..setInstance<TranslateService>(
      () => TranslateServiceImpl()..setInstance(),
      instanceType: InstanceType.singleton,
    );
  await routesConfig(injector);
  return injector;
}
