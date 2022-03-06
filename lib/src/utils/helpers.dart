import 'dart:async';

class Helpers {
  static void executeAfterTimerHack(Function f) {
    Timer(Duration(milliseconds: 0), () => {
      f()
    });
  }
}
