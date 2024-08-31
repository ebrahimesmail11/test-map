import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/drawer_item_list_tile.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/drawer_list_items_divider.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/section_social_media_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.gen.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  Widget buildDrawerHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(70.w, 10.h, 70.w, 10.h),
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue[100]),
          child: Assets.images.diskord.image(
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Ibrahim Ismail ',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          // style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          '01061769047 ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          // style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 295.h,
            child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
                child: buildDrawerHeader(context)),
          ),
         const  DrawerItemListItem(
            leadingIcon: Icons.person,
            title: 'My Profile',
          ),
          const DrawerItemListItemsDivider(),
          DrawerItemListItem(
            leadingIcon: Icons.history,
            title: 'Place History',
            onTap: () {},
          ),
          const DrawerItemListItemsDivider(),
          const  DrawerItemListItem(
            leadingIcon: Icons.settings,
            title: 'Settings',
          ),
          const DrawerItemListItemsDivider(),
          const  DrawerItemListItem(
            leadingIcon: Icons.help,
            title: 'help',
          ),
          buildLogoutBlocProvider(context),
          SizedBox(height: 100.h,),
          ListTile(
            leading: Text(
              'follow us',
          //  style: TextStyle(color: Colors.grey[600],fontSize: 16.sp),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.grey[600],),

            ),
          ),
          const  SectionSocialMediaIcon(),
        ],
      ),
    );
  }

  BlocProvider<PhoneAuthCubit> buildLogoutBlocProvider(BuildContext context) {
    return BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: DrawerItemListItem(
            leadingIcon: Icons.logout,
            title: 'Logout',
            color: Colors.red,
            trailing:const  SizedBox(),
            onTap: ()async {
              phoneAuthCubit.logOut(); 
              Navigator.of(context).pushReplacementNamed(loginScreen);
            },
          ),
        );
  }
}
