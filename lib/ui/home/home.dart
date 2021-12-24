import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/bloc/bloc.dart';
import 'package:zeenews/ui/ui.dart';
import 'package:zeenews/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: context.read<TabBloc>().length,
      child: const Scaffold(
        drawer: DrawerPage(),
        appBar: Toolbar(),
        body: TabView(),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tab = context.read<TabBloc>();
    return TabBarView(
      children: tab.tabs.map((text) {
        return text == 'LATEST'
            ? const ArticlePage()
            : EmptyWidget(
                title: 'Empty',
                subTitle: 'No Record Found',
                packageImage: PackageImage.Image_2,
              );
      }).toList(),
    );
  }
}
