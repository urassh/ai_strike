import 'dart:typed_data';

abstract class UploadAnswerImage {
  Future<void> uploadAnswerImage(Uint8List image, String filename);
}