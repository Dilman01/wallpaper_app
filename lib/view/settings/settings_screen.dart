import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/view/settings/widgets/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 50.spMin,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 700.h,
            width: 670.w,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30).r,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50).r,
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const SettingsButton(
                  title: 'Push notification',
                  svgPath: AssetPaths.notificationIcon,
                  isNotification: true,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                const SettingsButton(
                  title: 'Invite a friend',
                  svgPath: AssetPaths.inviteIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                const SettingsButton(
                  title: 'Rate this app',
                  svgPath: AssetPaths.starIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                const SettingsButton(
                  title: 'Feedback & bugs',
                  svgPath: AssetPaths.feedbackIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                const SettingsButton(
                  title: 'Terms & Conditions',
                  svgPath: AssetPaths.termsIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                const SettingsButton(
                  title: 'Privacy Policy',
                  svgPath: AssetPaths.privacyIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
