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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(20).r,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6).r,
              child: Center(
                child: SvgPicture.asset(
                  widget.svgPath,
                  height: 45.h,
                  width: 36.w,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall,
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
            activeTrackColor: Theme.of(context).colorScheme.onPrimaryContainer,
            activeColor: Theme.of(context).colorScheme.onSecondary,
            inactiveTrackColor: Theme.of(context).colorScheme.onSecondary,
          ),
        if (!widget.isNotification)
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).colorScheme.outline,
          ),
      ],
    );
  }
}
