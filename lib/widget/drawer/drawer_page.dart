
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Drawer(
       child: ListView(children: const [
         UserAccountsDrawerHeader(
           accountName: Text('Jitendra Kumar'),
           accountEmail: Text('jitendrasoam90@gmail.com'),
           currentAccountPicture: CircleAvatar(
             child: Icon(Icons.person),
           ),
         ),
       ])
   );
  }

}