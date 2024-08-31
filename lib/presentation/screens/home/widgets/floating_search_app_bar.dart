import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';


class FloatingSearchAppBar extends StatelessWidget {
  const FloatingSearchAppBar({super.key, this.controller});
final FloatingSearchBarController? controller;
  @override
  Widget build(BuildContext context) {
     final isPortrait =MediaQuery.of(context).orientation == Orientation.portrait;
      
    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: TextStyle(fontSize: 18.sp),
      queryStyle: TextStyle(fontSize: 18.sp),
    hint: 'Find a place...',
    border:const  BorderSide(style: BorderStyle.none, ),
    margins:   EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 0.h),
    padding: EdgeInsets.fromLTRB(2.h, 0.w, 2.h, 0.w),
    height: 52.h,
    iconColor: MyColors.primaryColor,
    scrollPadding:  EdgeInsets.only(top: 16.h, bottom: 56.w),
    transitionDuration: const Duration(milliseconds: 600),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
    },
    onFocusChanged: (isFocused) {
      
    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon:  Icon(Icons.place,color: Colors.black.withOpacity(0.6),),
          onPressed: () {},
        ),
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child:const  Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
            // children: Colors.accents.map((color) {
            //   return Container(height: 112.h, color: color);
            // }).toList(),
          ),
        ),
      );
    },
  );
  }
}