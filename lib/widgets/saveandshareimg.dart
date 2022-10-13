import 'dart:io';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> saveImage(Uint8List bytes) async {
  await [Permission.storage].request();
  final time = DateTime.now()
    ..toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
  final name = 'screenshot_$time';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);
  return result['filePath'];
}

Future saveAndShare3(
    Uint8List bytes1, Uint8List bytes2, Uint8List bytes3) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagefile1 = File("${directory.path}/flutter1.png");
  imagefile1.writeAsBytesSync(bytes1);

  final imagefile2 = File("${directory.path}/flutter2.png");
  imagefile2.writeAsBytesSync(bytes2);

  final imagefile3 = File("${directory.path}/flutter3.png");
  imagefile3.writeAsBytesSync(bytes3);

  await Share.shareFiles([imagefile1.path, imagefile2.path, imagefile3.path]);
}

Future saveAndShare2(Uint8List bytes1, Uint8List bytes2) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagefile1 = File("${directory.path}/flutter1.png");
  imagefile1.writeAsBytesSync(bytes1);

  final imagefile2 = File("${directory.path}/flutter2.png");
  imagefile2.writeAsBytesSync(bytes2);

  await Share.shareFiles([imagefile1.path, imagefile2.path]);
}

Future saveAndShare1(Uint8List bytes1) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagefile1 = File("${directory.path}/flutter1.png");
  imagefile1.writeAsBytesSync(bytes1);

  await Share.shareFiles([imagefile1.path]);
}
