import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/bloc/bloc.dart';

import 'logo/logo.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tab = context.read<TabBloc>();
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      backgroundColor: Colors.white,
      title: const LogoWidget(),
      titleSpacing: 0,
      centerTitle: true,
      bottom: TabBar(
        isScrollable: true,
        tabs: tab.tabs.map((title) {
          return Tab(
              child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
            ),
          ));
        }).toList(),
      ),
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.tv,
            color: Colors.black87,
          ),
          label: const Text(
            'LIVE TV',
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.8);
}
