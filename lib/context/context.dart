
import '../container/container.dart';
import '../container/container_application.dart';

abstract class ServiceLocatorContext {
  Container get();
  void setup(ServiceLocatorApplication koinApplication);
  void stop();
}

class GlobalContext implements ServiceLocatorContext {
  Container? _container;
  Scope? scope;

  ///
  /// Returns the global instance of the [Container].
  ///
  /// If koin has not been started with "startKoin" an
  /// IllegalStateException will be thrown.
  ///
  @override
  Container get() {
    if (_container == null) {
      throw Exception('ServiceLocatorContext has not been started.');
    }
    return _container!;
  }

  ///
  /// Start a Koin Application as StandAlone
  ///
  @override
  void setup(ServiceLocatorApplication koinApplication) {
    if (_container != null) {
      throw Exception('ServiceLocatorApplication has already been started');
    }
    _container = koinApplication.container;
  }

  ///
  /// Stop current StandAlone Koin application
  ///
  @override
  void stop() {
    //_container?.close();
    _container = null;
  }
}
