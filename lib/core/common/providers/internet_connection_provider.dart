import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_connection_provider.g.dart';

@riverpod
Stream<InternetConnectionStatus> internetConnection(
    InternetConnectionRef ref) async* {
  final internetChecker = InternetConnectionChecker();

  yield* internetChecker.onStatusChange.map(
    (status) {
      return status;
    },
  );
}
