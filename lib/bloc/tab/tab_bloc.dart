import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Cubit<int> {
  var tabs = [
    'HOME',
    'PHOTOS',
    'LATEST',
    'INDIA',
    'CORONAVIRUS',
    'VIDEOS',
    'WORLD',
    'STATES',
    'ENTERTAINMENT',
    'CRICKET',
    'SPORTS',
    'BUSINESS',
    'HEALTH',
    'TECHNOLOGY',
    'LIFESTYLE',
    'SCIENCE & ENVIRONMENT',
    'BLOGS',
  ];

  TabBloc() : super(0);

  int get length => tabs.length;

  String get title => tabs[state];

  void change(int index) => emit(index);
}
