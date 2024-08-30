import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/common/providers/language_code_provider.dart';
import 'package:wallpaper_app/generated/l10n.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final langCode = ref.watch(languageCodeProvider);

    return langCode.when(
      data: (data) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(S.of(context).language),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20).r,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(languageCodeProvider.notifier).changeLang('en');
                    },
                    child: SizedBox(
                      height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'English',
                            style: TextStyle(
                              fontSize: 40.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (data == 'en')
                            Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 60.r,
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(languageCodeProvider.notifier).changeLang('ar');
                    },
                    child: SizedBox(
                      height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'العربية',
                            style: TextStyle(
                              fontSize: 40.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (data == 'ar')
                            Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 60.r,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(S.of(context).error),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
