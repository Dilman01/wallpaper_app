// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categorires`
  String get categorires {
    return Intl.message(
      'Categorires',
      name: 'categorires',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Editor's Choice`
  String get firstTabTitle {
    return Intl.message(
      'Editor\'s Choice',
      name: 'firstTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get secondTabTitle {
    return Intl.message(
      'Trending',
      name: 'secondTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get thirdTabTitle {
    return Intl.message(
      'Latest',
      name: 'thirdTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Find Wallpapers...`
  String get searchHintText {
    return Intl.message(
      'Find Wallpapers...',
      name: 'searchHintText',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favoriteButtonText {
    return Intl.message(
      'Favorite',
      name: 'favoriteButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Dwonload`
  String get downloadButtonText {
    return Intl.message(
      'Dwonload',
      name: 'downloadButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Set`
  String get setButtonText {
    return Intl.message(
      'Set',
      name: 'setButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Image was downloaded successfully! 😊`
  String get imageDownloadSuccess {
    return Intl.message(
      'Image was downloaded successfully! 😊',
      name: 'imageDownloadSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Set on home screen`
  String get setWallpaperHome {
    return Intl.message(
      'Set on home screen',
      name: 'setWallpaperHome',
      desc: '',
      args: [],
    );
  }

  /// `Set on lock screen`
  String get setWallpaperLock {
    return Intl.message(
      'Set on lock screen',
      name: 'setWallpaperLock',
      desc: '',
      args: [],
    );
  }

  /// `Set on both screen`
  String get setWallpaperBoth {
    return Intl.message(
      'Set on both screen',
      name: 'setWallpaperBoth',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to do?`
  String get bottomSheetTitle {
    return Intl.message(
      'What would you like to do?',
      name: 'bottomSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Wallpaper set!`
  String get setDialogHeader {
    return Intl.message(
      'Wallpaper set!',
      name: 'setDialogHeader',
      desc: '',
      args: [],
    );
  }

  /// `All done! your phone looks amazing.`
  String get setDialogBody {
    return Intl.message(
      'All done! your phone looks amazing.',
      name: 'setDialogBody',
      desc: '',
      args: [],
    );
  }

  /// `DISSMISS`
  String get dismiss {
    return Intl.message(
      'DISSMISS',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Search for something...`
  String get searchFor {
    return Intl.message(
      'Search for something...',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `No Results were found!\nTry searching for another term.`
  String get searchNoResult {
    return Intl.message(
      'No Results were found!\nTry searching for another term.',
      name: 'searchNoResult',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection!`
  String get noInternetTitle {
    return Intl.message(
      'No Internet Connection!',
      name: 'noInternetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check you connection then refresh the page.`
  String get noInternetBody {
    return Intl.message(
      'Please check you connection then refresh the page.',
      name: 'noInternetBody',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Push notification`
  String get pushNotification {
    return Intl.message(
      'Push notification',
      name: 'pushNotification',
      desc: '',
      args: [],
    );
  }

  /// `Invite a friend`
  String get invite {
    return Intl.message(
      'Invite a friend',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app`
  String get rate {
    return Intl.message(
      'Rate this app',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Feedback & bugs`
  String get feedback {
    return Intl.message(
      'Feedback & bugs',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! try again later.`
  String get error {
    return Intl.message(
      'Something went wrong! try again later.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No favorites found.`
  String get noFavorites {
    return Intl.message(
      'No favorites found.',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Change the language`
  String get language {
    return Intl.message(
      'Change the language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
