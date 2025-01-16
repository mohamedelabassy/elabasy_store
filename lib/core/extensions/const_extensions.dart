import 'package:elabasy_store/core/language/app_localizations.dart';
import 'package:elabasy_store/core/style/theme/assets_extensions.dart';
import 'package:elabasy_store/core/style/theme/color_extensions.dart';
import 'package:flutter/material.dart';

extension ConTextExt on BuildContext {
// color
  MyColors get color => Theme.of(this).extension<MyColors>()!;
// IMAGES
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;
//languages
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

  // navigator
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
