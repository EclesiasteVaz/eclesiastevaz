import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();

  static ThemeData themeData() => ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(206, 18, 21, 31),
    colorSchemeSeed: Colors.blue,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.white,
      color: Colors.white,
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
