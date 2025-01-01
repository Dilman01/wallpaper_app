import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_connection_provider.g.dart';

@riverpod
Stream<InternetConnectionStatus> internetConnection(Ref ref) async* {
  final internetChecker = InternetConnectionChecker.createInstance();

  yield* internetChecker.onStatusChange.map(
    (status) {
      return status;
    },
  );
}
