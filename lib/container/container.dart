import 'dart:core';

import 'package:service_locator/qualifier.dart';

abstract class Scope {
  T get<T extends Object>([Qualifier? qualifier]);
  T getWithParam<T extends Object, P>(P parameter, {Qualifier? qualifier});
}

typedef Creater<T> = T Function(Scope scope);

typedef CreaterWithParam<T, A> = T Function(Scope scope, A param);

abstract class Container {
  /// Declare a singleton definition
  Container single<T extends Object>(
    Creater<T> create, {
    Qualifier? qualifier,
    bool createdAtStart = false,
    bool override = false,
  });

  T get<T extends Object>([Qualifier? qualifier]);

  ///
  /// Declare a singleton definition
  ///
  Container singleWithParam<T extends Object, A>(
    CreaterWithParam<T, A> create, {
    Qualifier? qualifier,
    bool createdAtStart = false,
    bool override = false,
  });

  ///
  /// Declare a Factory definition
  ///
  Container factory<T extends Object>(
    Creater<T> create, {
    Qualifier? qualifier,
    bool createdAtStart = false,
    bool override = false,
  });

  ///
  /// Declare a Factory definition
  ///
  Container factoryWithParam<T extends Object, A>(
    CreaterWithParam<T, A> create, {
    Qualifier? qualifier,
    bool createdAtStart = false,
    bool override = false,
  });

  /*
  Options makeOptions({bool override = false, bool createdAtStart = false}) {
    return Options(
        isCreatedAtStart: createAtStart || createdAtStart,
        override: this.override || override);
  }*/
}
