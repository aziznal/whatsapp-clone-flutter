import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/page-params.model.dart';

class ScreenRoutes {
  static String about = '/about';
  static String addNewChat = '/add-new-chat';

  static Chat chat = Chat();
}

class Chat {
  String template = '/chat/:${ChatScreenParameters.chatId}';

  String withChatId(String chatId) {
    return '/chat/$chatId';
  }
}
