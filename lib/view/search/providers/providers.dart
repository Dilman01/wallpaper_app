import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class SearchText extends _$SearchText {
  @override
  String build() {
    return '';
  }

  void changeText(String text) {
    state = text;
  }
}
