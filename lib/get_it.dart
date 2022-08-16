import 'package:get_it/get_it.dart';
import 'package:service_locator/container/container.dart';
import 'package:service_locator/qualifier.dart';

class GetItScope implements Scope {
  final GetIt getIt;

  GetItScope(this.getIt);

  @override
  T get<T extends Object>([Qualifier? qualifier]) {
    return getIt.get<T>();
  }

  @override
  T getWithParam<T extends Object, P>(P parameter, {Qualifier? qualifier}) {
    return getIt.get<T>(param1: parameter);
  }
}

class GetItContainer implements Container {
  final GetIt getIt;

  GetItContainer(this.getIt);

  @override
  Container factory<T extends Object>(Creater<T> create,
      {Qualifier? qualifier,
      bool createdAtStart = false,
      bool override = false}) {
    getIt.registerFactory<T>(() => create(GetItScope(getIt)));
    return this;
  }

  @override
  Container factoryWithParam<T extends Object, A>(CreaterWithParam<T, A> create,
      {Qualifier? qualifier,
      bool createdAtStart = false,
      bool override = false}) {
    getIt.registerFactoryParam<T, A, dynamic>(
        (p1, p2) => create(GetItScope(getIt), p1));

    return this;
  }

  @override
  Container single<T extends Object>(Creater<T> create,
      {Qualifier? qualifier,
      bool createdAtStart = false,
      bool override = false}) {
    getIt.registerLazySingleton(() => create(GetItScope(getIt)));
    return this;
  }

  @override
  Container singleWithParam<T extends Object, A>(CreaterWithParam<T, A> create,
      {Qualifier? qualifier,
      bool createdAtStart = false,
      bool override = false}) {
    return this;
  }

  @override
  T get<T extends Object>([Qualifier? qualifier]) {
    return getIt.get<T>();
  }
}
