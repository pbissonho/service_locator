import 'dart:core';

abstract class Scope {
  T get<T extends Object>();
  T getWithParam<T extends Object, P>(P parameter);
}

typedef Creater<T> = T Function(Scope scope);

typedef CreaterWithParam<T, A> = T Function(Scope scope, A param);

abstract class Container {
  T get<T extends Object>();
  T getWithParam<T extends Object, P>(P parameter);

  ///
  /// Declare a Factory definition
  ///
  Container factory<T extends Object>(Creater<T> create);

  /// Declare a singleton definition
  Container singleton<T extends Object>(Creater<T> create);

  ///
  /// Declare a Factory definition
  ///
  Container factoryWithParam<T extends Object, A>(
      CreaterWithParam<T, A> create);

  void close();
}
