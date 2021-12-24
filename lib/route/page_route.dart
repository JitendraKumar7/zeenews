import 'package:flutter/material.dart';
import 'package:zeenews/ui/ui.dart';

Route<PageRoute> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) {
      switch (settings.name) {
        case '/':
          return const HomePage();
        case '/detail':
          return const DetailPage();
        default:
          return const Scaffold(body: Center(child: Text('Not Found')));
      }
    },
    settings: settings,
  );
}
