import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main(List<String> args) {
    return runApp(ModularApp(
      module: AppModule(), 
      child: const AppWidget(),
    ),
  );
}
//! Create process AppModule
class AppModule extends Module {
  List<Bind> get bind => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage(),
    ),
  ];
}

//! Main Page
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      //! Add Modular Attribute     
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

//! Result HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: const Center(
        child: Text('This is my App with Modular'),
      ),
    );
  }
}
