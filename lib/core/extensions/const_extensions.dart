import 'package:elabasy_store/core/style/theme/color_extensions.dart';
import 'package:flutter/material.dart';

extension ConTextExt on BuildContext {
// color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

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
