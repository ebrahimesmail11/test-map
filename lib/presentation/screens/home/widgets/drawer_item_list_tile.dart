import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/my_colors.dart';

// ignore: must_be_immutable
class DrawerItemListItem extends StatelessWidget {
   const DrawerItemListItem({super.key, required this.leadingIcon, required this.title, this.onTap, this.color, this.trailing});
final IconData? leadingIcon;
final String title;
final  Widget? trailing;
final Color? color;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(leadingIcon, color: color ?? MyColors.primaryColor, ),
      title: Text(title, ),
      trailing: trailing??const Icon(Icons.arrow_right, color: MyColors.primaryColor,),
      onTap: onTap,
    );
  }
}