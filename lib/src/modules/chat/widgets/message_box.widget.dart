import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';
import 'package:com.aziznal.whatsapp_clone/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class MessageSendFieldWidget extends StatelessWidget {
  const MessageSendFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 90,
          child: createMessageSendField(),
        ),
        Expanded(
          flex: 20,
          child: createSendButton(context),
        ),
      ],
    );
  }

  Widget createSendButton(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => showComingSoonSnackBar(context),
      elevation: 4.0,
      fillColor: CustomPrimaryColor.whatsappTeal.shade300,
      child: Icon(
        Icons.send,
        size: 35.0,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }

  Widget createMessageSendField() {
    return Container(
      color: Color.fromARGB(255, 0, 63, 180),
      child: Center(child: Text('MessageSendFieldWidget')),
    );
  }
}
