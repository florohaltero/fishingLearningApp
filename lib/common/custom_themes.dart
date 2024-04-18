import 'package:angelschein_lernen/common/color_scheme.dart';
import 'package:angelschein_lernen/common/text_style.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        textTheme: textTheme(darkColorScheme),
      );

  ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        textTheme: textTheme(lightColorScheme),
      );
}
