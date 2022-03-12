import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';

class Contact {
  late String id;
  final String name;
  final String number;
  final String status;
  final String imageAssetPath;

  Contact({
    required this.name,
    required this.number,
    required this.status,
    required this.imageAssetPath,
  }) {
    id = Utils.getRandomUuid();
  }
}
