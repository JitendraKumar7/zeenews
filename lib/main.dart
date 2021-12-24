import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'repository/repository.dart';
import 'route/page_route.dart';

void main() {
  var repository = ApiRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ArticleBloc(repository)),
      BlocProvider(create: (_) => DetailBloc(repository)),
      BlocProvider(create: (_) => TabBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zee News',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
