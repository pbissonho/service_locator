
import 'package:service_locator/container/container_application.dart';

import '../container/container.dart';
import 'context.dart';

//ignore: avoid_classes_with_only_static_members
/// Help hold any implementation of KoinContext
class ServiceLocatorContextHandler {
  static ServiceLocatorContext? _context;

  ////
  ///Retrieve current KoinContext
  ///
  static ServiceLocatorContext getContext() {
    if (_context == null) {
      throw Exception('''
No Koin Context configured. Please use startKoin or koinApplication DSL. ''');
    }
    return _context!;
  }

  ////
  ///Retrieve current KoinContext
  ///
  static Container get() => getContext().get();

  ///
  ///Register new KoinContext
  ///
  /// @throws IllegalStateException if already registered
  ///
  static void register(ServiceLocatorContext koinContext) {
    if (_context != null) {
      throw Exception('A ServiceLocatorContext is already started');
    }
    _context = koinContext;
  }

  ///
  /// Start a Koin Application on current KoinContext
  ///
  static void start(ServiceLocatorApplication koinApplication) {
    getContext().setup(koinApplication);
  }

  ///
  ///Stop current KoinContext & clear it
  ///
  static void stop() {
    _context?.stop();
    _context = null;
  }
}