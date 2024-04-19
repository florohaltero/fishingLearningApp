import 'dart:async';
import 'dart:developer';

import 'package:angelschein_lernen/environment.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required Environment environment,
}) async {
  log('Start init of App - $environment');

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  runApp(await builder());
  log('End init of App');
}
