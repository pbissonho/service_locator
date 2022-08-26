
## GetIt + Abstração and Provider

A wrapper around GetIt service locator package.

## Motivation

Simplify and make using GetIt scalable.

 - Provides a base modular approach
 - Decrease coupling
 - Make code more testable
 - Provider is the default approach used in the flutter_bloc package
 - No code generation needed
 - Código aberto para extensão
 

 
## Getting started

### Declare some classes 

```dart
// Given some classes 

abstract class Repository {}

class ProdRepository implements Repository {}

class DevRepository implements Repository {}

class Bloc {
  final Repository service;

  Bloc(this.service);

  get state => "Hello";
}
```


### Declare DI modules

```dart
//
class MyModule extends Module {
  @override
  void register(Container container) {
    container
      // Declare a single definition for Bloc class  
      ..singleton<Repository>((s) => ProdRepository())
      // Declare a factory provider definition for Repository class
      ..factory((s) => Bloc(s.get());
  }
}

//
class MyDevModule extends Module {
  @override
  void register(Container container) {
    container
      // Declare a single definition for Bloc class  
      ..singleton<Repository>((s) => DevRepository())
      // Declare a factory provider definition for Repository class
      ..factory((s) => Bloc(s.get());
  }
}
```

### Starting modules

Use the startServiceLocator() function to start in your application.

In a Dart app:

```dart
void main() {
  final myModule = MyModule();
  final myDevModule = MyDevModule();

  startServiceLocator((app) {
    if (kReleaseMode) {
      app.module(myModule);

      // can also start a list of modules
      // app.modules([myModuleA, myModuleB, myModuleC]);

    } else {
      app.module(myDevModule);
    }

  });

  runApp(const MyApp());
}
```

### Resolve dependencies

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: ((context) => MyCounterCubit(0, ServiceLocator.get())),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}```

### 

Outras soluções 

Koin.dart + Provider + BlocProvider
Riverpod(apenas como service locator)





