import 'package:elabasy_store/core/style/colors/colors_dark.dart';
import 'package:elabasy_store/core/style/colors/colors_light.dart';
import 'package:elabasy_store/core/style/theme/assets_extensions.dart';
import 'package:elabasy_store/core/style/theme/color_extensions.dart';
import 'package:flutter/material.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
  );
}

ThemeData themeLight() {
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
    scaffoldBackgroundColor: ColorsLight.mainColor,
    useMaterial3: true,
  );
}
