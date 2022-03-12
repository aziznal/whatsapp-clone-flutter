import 'package:flutter/material.dart';

// REFACTOR: too much copy paste

/// Extension that adds methods for adding padding between items for lists of [Widget]
/// 
/// Example:
/// ```dart
/// Column(
///   children: [
///     Text('item 1'),
///     Text('item 2'),
///     .
///     .
///   ].addBottomPadding(12.0);
/// )
/// ```
extension PaddingBetweenItems on List<Widget> {
  List<Widget> addPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.all(paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }

  List<Widget> addVerticalPadding(double paddingAmount) {
    return map(
      (widget) {
        return Padding(
          padding: EdgeInsets.only(top: paddingAmount, bottom: paddingAmount),
          child: widget,
        );
      },
    ).toList();
  }

  List<Widget> addHorizontalPadding(double paddingAmount) {
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
