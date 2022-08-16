import 'package:get_it/get_it.dart';
import 'package:service_locator/get_it.dart';

import '../context/context.dart';
import '../context/context_handler.dart';
import 'container.dart';

import 'module.dart';

class ServiceLocatorApplication {
  
  static final GetIt _getIt = GetIt.asNewInstance();
  Container container = GetItContainer(_getIt);

  /// Register module
  /// @param module
  ///
  ServiceLocatorApplication module(Module module) {
    return modules([module]);
  }

  Scope get scope => GetItScope(_getIt);

  ///
  /// Register modules
  /// @param modules
  ///
  ServiceLocatorApplication modules(List<Module> modules) {
    for (var module in modules) {
      module.register(container);
    }
    return this;
  }
}

ServiceLocatorApplication startServiceLocator(
  Function(ServiceLocatorApplication app) appDeclaration,
) {
  final containerApplication = ServiceLocatorApplication();
  final globalContext = GlobalContext();
  globalContext.setup(containerApplication);
  ServiceLocatorContextHandler.register(globalContext);
  appDeclaration(containerApplication);

  return containerApplication;
}
