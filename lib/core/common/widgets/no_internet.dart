import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/common/providers/internet_connection_provider.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/generated/l10n.dart';

class NoInternet extends ConsumerWidget {
  const NoInternet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              S.of(context).noInternetTitle,
              style: TextStyle(
                fontSize: 50.spMin,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(25, 30, 49, 1),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ).r,
            child: SvgPicture.asset(
              AssetPaths.noInternet,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ).r,
            child: Text(
              S.of(context).noInternetBody,
              style: TextStyle(
                fontSize: 30.spMin,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(25, 30, 49, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(internetConnectionProvider);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(25, 30, 49, 1),
              foregroundColor: Colors.white,
              fixedSize: Size(300.w, 50.h),
            ),
            child: Text(S.of(context).retry),
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
