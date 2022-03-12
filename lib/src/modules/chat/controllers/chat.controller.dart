import 'package:com.aziznal.whatsapp_clone/src/modules/chat/models/chat_screen_parameters.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';
import 'package:get/get.dart';

/// Manages loading chat data and screen loading state

class ChatController extends GetxController {
  var isLoading = true.obs;
  Chat? chat;

  /// Returns chatId param value
  ///
  /// Throws [ArgumentError] if chatId is null
  String _getChatIdFromParams() {
    String? chatId = Get.parameters[ChatScreenParameters.chatId];

    if (chatId == null) {
      Get.back();
      throw ArgumentError('No value for chatId was detected', 'chatId');
    }

    return chatId;
  }

  /// Assigns value to [chat] using service
  void loadChat() async {
    String chatId = _getChatIdFromParams();

    chat = await ChatService.fetchChatById(chatId);
    isLoading(false);
  }
}
