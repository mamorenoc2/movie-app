import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    // ignore: use_full_hex_values_for_flutter_colors
    colorSchemeSeed: const Color(0xfff2862f5)
  );
}