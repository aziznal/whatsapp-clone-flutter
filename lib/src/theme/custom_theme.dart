import 'package:flutter/material.dart';

class CustomPrimaryColor {
  /// Primary Color
  static const int _whatsappTealPrimaryValue = 0xFF005C4B;

  static const MaterialColor whatsappTeal = MaterialColor(
    _whatsappTealPrimaryValue,
    <int, Color>{
      50: Color(0xFFE0EBE9),
      100: Color(0xFFB3CEC9),
      200: Color(0xFF80AEA5),
      300: Color(0xFF4D8D81),
      400: Color(0xFF267466),
      500: Color(_whatsappTealPrimaryValue),
      600: Color(0xFF005444),
      700: Color(0xFF004A3B),
      800: Color(0xFF004133),
      900: Color(0xFF003023),
    },
  );
}

class ChatColors {
  static var messageListBackground = Color.fromARGB(255, 243, 243, 243);

  static var sentMessageColor = Color.fromARGB(225, 220, 240, 197);
  static var receivedMessageColor = Colors.white;
}
