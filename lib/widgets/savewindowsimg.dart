import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

Future saveWindows3(Uint8List bytes1, Uint8List bytes2, Uint8List bytes3,
    String ministerio) async {
  final directory = await getApplicationDocumentsDirectory();
  String dir = "";

  if (directory.path.contains("Documents")) {
    dir = directory.path.replaceFirst("Documents", "Desktop");
  } else if (directory.path.contains("Documentos")) {
    dir = directory.path.replaceFirst("Documentos", "Escritorio");
  } else {
    dir = directory.path;
  }

  final imagefile1 = File("$dir/Captura1 $ministerio.png");
  imagefile1.writeAsBytesSync(bytes1);

  final imagefile2 = File("$dir/Captura2 $ministerio.png");
  imagefile2.writeAsBytesSync(bytes2);

  final imagefile3 = File("$dir/Captura3 $ministerio.png");
  imagefile3.writeAsBytesSync(bytes3);
}

Future saveWindows2(
    Uint8List bytes1, Uint8List bytes2, String ministerio) async {
  final directory = await getApplicationDocumentsDirectory();
  String dir = "";

  if (directory.path.contains("Documents")) {
    dir = directory.path.replaceFirst("Documents", "Desktop");
  } else if (directory.path.contains("Documentos")) {
    dir = directory.path.replaceFirst("Documentos", "Escritorio");
  } else {
    dir = directory.path;
  }

  final imagefile1 = File("$dir/Captura1 $ministerio.png");
  imagefile1.writeAsBytesSync(bytes1);

  final imagefile2 = File("$dir/Captura2 $ministerio.png");
  imagefile2.writeAsBytesSync(bytes2);
}

Future saveWindows1(Uint8List bytes1, String ministerio) async {
  final directory = await getApplicationDocumentsDirectory();
  String dir = "";

  if (directory.path.contains("Documents")) {
    dir = directory.path.replaceFirst("Documents", "Desktop");
  } else if (directory.path.contains("Documentos")) {
    dir = directory.path.replaceFirst("Documentos", "Escritorio");
  } else {
    dir = directory.path;
  }

  final imagefile1 = File("$dir/Captura1 $ministerio.png");
  imagefile1.writeAsBytesSync(bytes1);
}
