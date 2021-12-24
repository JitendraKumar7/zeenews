import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: 42,
        height: 42,
        child: const Text(
          'ZEE',
          style: TextStyle(fontSize: 13),
        ),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
      const Text(
        'NEWS',
        style: TextStyle(
          color: Colors.red,
          fontSize: 13,
        ),
      ),
    ]);
  }
}
