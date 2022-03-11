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

  List<Widget> addTopPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(top: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }

  List<Widget> addBottomPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(bottom: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }

  List<Widget> addLeftPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(left: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }

  List<Widget> addRightPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(right: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }
}
