import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/chat_screen_parameters.model.dart';

/// Stores all routes for pages that can be routed to using named routes.
/// 
/// Use the routes in this class when using methods like [Get.toNamed]
/// 
/// Example:
/// ```dart
/// // basic routing
/// Get.toNamed(ScreenRoutes.about)
/// 
/// // more complex routing
/// Get.toNamed(ScreenRoutes.chat.withChatId(chatId))
/// ```
class ScreenRoutes {
  static String about = '/about';
  static String addNewChat = '/add-new-chat';

  static _Chat chat = _Chat();
}

class _Chat {
  String template = '/chat/:${ChatScreenParameters.chatId}';

  String withChatId(String chatId) {
    return '/chat/$chatId';
  }
}
