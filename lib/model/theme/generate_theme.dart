// lib/model/theme/generate_theme.dart
import 'dart:io';
import 'theme.dart'; // Themeクラスのインポートパスを確認してください

/// GenerateThemeインターフェース
abstract class GenerateTheme {
  /// ユニークなお題を生成します。
  Future<Theme> generalTheme();

  /// 選択された画像の内容を説明します。
  Future<String> describeImage(File imageFile);
}