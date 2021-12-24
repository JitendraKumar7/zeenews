import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taboola/taboola.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Jitendra Kumar'),
          accountEmail: Text('jitendrasoam90@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        ListTile(
          onTap: () async {
            try {
              var result = await Taboola.taboolaExample;
              debugPrint('taboolaExample $result');
            } on PlatformException {
              debugPrint('Failed to get platform version.');
            }
          },
          title: const Text('Taboola Example'),
        ),
        const Divider(),
      ]),
    );
  }
}
