import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logo/logo.dart';

class SilverToolbar extends StatelessWidget implements PreferredSizeWidget {

  const SilverToolbar( {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const LogoWidget(),
      titleSpacing: 0,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
