import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

extension Uint8ListExt on Uint8List {
  Future<File> saveToFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(this);
    return file;
  }
}
