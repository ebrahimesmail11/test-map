import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/screens/home/widgets/social_media_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionSocialMediaIcon extends StatelessWidget {
  const SectionSocialMediaIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      child: Row(
        children: [
        const  SocialMediaIcon(icon: FontAwesomeIcons.linkedin, url: 'https://www.linkedin.com/in/ebrahim-esmail'),
        15.horizontalSpace,
        const   SocialMediaIcon(icon: FontAwesomeIcons.github, url: 'https://github.com/ebrahimesmail11'),
          15.horizontalSpace,
        const   SocialMediaIcon(icon: FontAwesomeIcons.googleDrive, url: 'https://drive.google.com/file/d/11ADsQXwNXKTY3m857ljKWEfI38ebC3c8/view?usp=drivesdk'),
        ],
      ),
    );
  }
}