import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_code_provider.g.dart';
// final SharedPreferences prefs = await SharedPreferences.getInstance();

@riverpod
class LanguageCode extends _$LanguageCode {
  @override
  Future<String> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final code = prefs.getString('lang-code') ?? 'en';

    return Future.value(code);
  }

  void changeLang(String code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('lang-code', code);

    state = AsyncData(code);
  }
}
