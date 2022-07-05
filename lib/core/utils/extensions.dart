import 'package:flutter/material.dart';

extension XPadding on Widget {
  Widget horizonatlPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: this,
    );
  }

  Widget h1() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: this,
    );
  }
}
