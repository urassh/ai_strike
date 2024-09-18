import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'model/theme/generateThemeImpl.dart'; // パスを確認
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // 画像選択用パッケージ

void main() async {
  // .env ファイルのロード
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Text & Image Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextImageGeneratorScreen(),
    );
  }
}

class TextImageGeneratorScreen extends StatefulWidget {
  @override
  _TextImageGeneratorScreenState createState() => _TextImageGeneratorScreenState();
}

class _TextImageGeneratorScreenState extends State<TextImageGeneratorScreen> {
  String _generatedText = 'まだ生成されていません';
  String _imageDescription = '画像を選択して説明を生成してください';
  File? _selectedImage;
  final _picker = ImagePicker();

  Future<void> _generateText() async {
    try {
      // GenerateThemeImplを使ってテーマを生成
      final generateThemeImpl = GenerateThemeImpl();
      final theme = await generateThemeImpl.generalTheme();
      setState(() {
        _generatedText = theme.title;  // 生成されたテキストを画面に表示
      });
    } catch (e) {
      setState(() {
        _generatedText = 'エラー: $e'; // エラーメッセージを表示
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      _describeImage(File(pickedFile.path));
    }
  }

  Future<void> _describeImage(File imageFile) async {
    try {
      final generateThemeImpl = GenerateThemeImpl();
      final description = await generateThemeImpl.describeImage(imageFile);
      setState(() {
        _imageDescription = description;  // 画像の説明を表示
      });
    } catch (e) {
      setState(() {
        _imageDescription = '画像説明のエラー: $e'; // エラーメッセージを表示
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gemini Text & Image Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_generatedText),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateText,
              child: Text('テキストを生成'),
            ),
            SizedBox(height: 40),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : Text('画像が選択されていません'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('画像を選択'),
            ),
            SizedBox(height: 20),
            Text(_imageDescription),
          ],
        ),
      ),
    );
  }
}
