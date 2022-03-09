import 'dart:async';

import 'package:uuid/uuid.dart';

class Utils {
  static void executeAfterTimerHack(Function f) {
    Timer(Duration(milliseconds: 0), () => {f()});
  }

  static String generateRandomId() {
    return Uuid().v1();
  }
}
