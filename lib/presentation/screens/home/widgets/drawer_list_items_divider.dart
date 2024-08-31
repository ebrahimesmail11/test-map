import 'package:flutter/material.dart';

class DrawerItemListItemsDivider extends StatelessWidget {
  const DrawerItemListItemsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }
}