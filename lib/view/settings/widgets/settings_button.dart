import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    super.key,
    required this.title,
    required this.svgPath,
    this.isNotification = false,
  });

  final String title;
  final String svgPath;
  final bool isNotification;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 70.h,
              width: 70.h,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 30, 49, 1),
                borderRadius: BorderRadius.circular(20).r,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6).r,
              child: Center(
                child: SvgPicture.asset(
                  widget.svgPath,
                  height: 45.h,
                  width: 36.w,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: const Color.fromRGBO(34, 34, 34, 1),
                fontSize: 35.spMin,
              ),
            ),
          ],
        ),
        if (widget.isNotification)
          Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
            activeTrackColor: const Color.fromRGBO(25, 30, 49, 1),
            inactiveTrackColor: Colors.white,
          ),
        if (!widget.isNotification)
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color.fromRGBO(197, 197, 197, 1),
          ),
      ],
    );
  }
}
