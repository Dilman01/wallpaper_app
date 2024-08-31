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
            appBar: AppBar(
              title: Text(
                S.of(context).language,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
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
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          if (data == 'en')
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.onTertiary,
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
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          if (data == 'ar')
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.onTertiary,
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
        child: Text(
          S.of(context).error,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
