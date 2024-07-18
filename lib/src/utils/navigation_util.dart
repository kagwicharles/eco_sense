import 'package:flutter/material.dart';

extension NavigationUtil on BuildContext {
  Future<dynamic> navigate(Widget widget) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
