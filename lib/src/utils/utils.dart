import 'dart:async';

import 'package:uuid/uuid.dart';

/// Basic helper utils class that includes shameful methods and hacks that I was
/// too lazy to figure out a better way around
class Utils {
  /// This method executes the given function [f] after a timeout with a
  /// duration of 0
  ///
  /// This method is meant to be used to defer the execution of the given
  /// function [f] to a different scope (maybe) such that it doesn't get
  /// destroyed when it's calling scope is also destroyed. Pure speculation
  /// though.
  static void executeAfterTimerHack(Function f) {
    Timer(Duration(milliseconds: 0), () => {f()});
  }

  static String getRandomUuid() {
    return Uuid().v1();
  }
}
