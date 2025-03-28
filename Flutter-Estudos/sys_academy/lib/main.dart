import 'package:flutter/material.dart';
import 'package:sys_academy/routes.dart';

void main() {
  runApp(
    MaterialApp.router(
      darkTheme: ThemeData.dark(),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    ),
  );
}
