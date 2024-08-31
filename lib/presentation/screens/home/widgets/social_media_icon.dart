import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key,required this.url, required this.icon});
final String  url;
final IconData icon;
void _launchUrl(String url) async {
  await canLaunchUrl(Uri.parse(url)) ? await launchUrl(Uri.parse(url)) : throw 'Could not launch $url';

}
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => _launchUrl(url),
      child: Icon(
        icon,
        color: MyColors.primaryColor,
        size: 35,
      ),
    );
  }
}