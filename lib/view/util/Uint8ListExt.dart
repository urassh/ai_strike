import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

extension Uint8ListExt on Uint8List {
  Future<File> saveToFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    print("Saving file to: $filePath"); // ログ追加
    final file = File(filePath);
    await file.writeAsBytes(this);
    print("File saved successfully"); // ログ追加
    return file;
  }
}
