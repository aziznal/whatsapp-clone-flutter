import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    required this.chatItemData,
    Key? key,
  }) : super(key: key);

  final Chat chatItemData;

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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chatItemData.contact.name,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(chatItemData.messages.last.body),
      ].addVerticalSpacing(2),
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
          child: Image.asset(chatItemData.contact.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }
}