
import '../container/container.dart';
import '../container/container_application.dart';

abstract class ServiceLocatorContext {
  Container get();
  void setup(ServiceLocatorApplication application);
  void stop();
}

class GlobalContext implements ServiceLocatorContext {
  Container? _container;
  Scope? scope;

  ///
  /// Returns the global instance of the [Container].
  ///
  /// If ServiceLocator has not been started with "startServiceLocator" an
  /// Exception will be thrown.
  ///
  @override
  Container get() {
    if (_container == null) {
      throw Exception('ServiceLocatorContext has not been started.');
    }
    return _container!;
  }

  @override
  void setup(ServiceLocatorApplication application) {
    if (_container != null) {
      throw Exception('ServiceLocatorApplication has already been started');
    }
    _container = application.container;
  }

  ///
  /// Stop current container
  ///
  @override
  void stop() {
    //_container?.close();
    _container = null;
  }
}
