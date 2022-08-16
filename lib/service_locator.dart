library service_locator;

import 'package:service_locator/context/context_handler.dart';

import 'qualifier.dart';

export 'container/module.dart';
export 'container/container_application.dart';
export 'container/container.dart';
export 'context/context_handler.dart';
export 'context/context_handler.dart';

class ServiceLocator {
  static T get<T extends Object>([Qualifier? qualifier]){
    return ServiceLocatorContextHandler.get().get<T>();
  }
  
  /*T getWithParam<T extends Object, P>(P parameter, {Qualifier? qualifier}){

  }*/
}