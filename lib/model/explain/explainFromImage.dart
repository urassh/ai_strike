import 'dart:io';

abstract class ExplainFromImage {
  Future<String> explainFromImage(File imageFile);
}
