import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/chat_screen_parameters.model.dart';

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
