
import 'package:service_locator/container/container_application.dart';

import '../container/container.dart';
import 'context.dart';

/// Help hold any implementation of ServiceLocatorContext
class ServiceLocatorContextHandler {
  static ServiceLocatorContext? _context;

  ////
  /// Retrieve current ServiceLocatorContext
  ///
  static ServiceLocatorContext getContext() {
    if (_context == null) {
      throw Exception('''
Context not initialized. Please use startServiceLocator''');
    }
    return _context!;
  }

  ////
  /// Retrieve current context
  ///
  static Container get() => getContext().get();

  ///
  ///Register new context
  ///
  /// @throws Exception if already registered
  ///
  static void register(ServiceLocatorContext context) {
    if (_context != null) {
      throw Exception('A ServiceLocatorContext is already started');
    }
    _context = context;
  }

  ///
  /// Start a ServiceLocatorApplication on current context
  ///
  static void start(ServiceLocatorApplication application) {
    getContext().setup(application);
  }

  ///
  /// Close current context
  ///
  static void stop() {
    _context?.stop();
    _context = null;
  }
}