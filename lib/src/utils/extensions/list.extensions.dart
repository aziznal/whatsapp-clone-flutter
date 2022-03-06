import 'package:flutter/material.dart';

extension AddPaddingBetweenListItems on List<Widget> {
  List<Widget> addSpacing(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.all(paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }
}

extension AddVerticalPaddingBetweenListItems on List<Widget> {
  List<Widget> addVerticalSpacing(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(top: paddingAmount, bottom: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }
}

extension AddHorizontalPaddingBetweenListItems on List<Widget> {
  List<Widget> addHorizontalSpacing(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(left: paddingAmount, right: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }
}
