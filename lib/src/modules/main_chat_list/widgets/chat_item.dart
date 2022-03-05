import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/modules/common/models/chat_item.dart';
import 'package:whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    required this.chatItemData,
    Key? key,
  }) : super(key: key);

  final ChatItem chatItemData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getImageWidget(context),
            getTitleAndSubtitle(),
          ],
        ),
      ),
      onTap: () {},
      splashColor: const Color.fromARGB(255, 136, 136, 136),
    );
  }

  Column getTitleAndSubtitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(chatItemData.title, textAlign: TextAlign.start),
        Text(chatItemData.subtitle),
      ],
    );
  }

  GestureDetector getImageWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 60,
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image.asset('assets/images/app-icon.png'),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }
}
