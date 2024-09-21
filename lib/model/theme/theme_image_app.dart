// theme_image_app.dart (旧 main.dart)
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'model/theme/generateThemeImpl.dart'; // インポートパスを修正
import 'model/theme/app_theme.dart'; // AppThemeクラスのインポート

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // これを追加
  await dotenv.load(fileName: ".env");  // .envファイルの名前を指定
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIお題生成＆画像説明アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThemeAndImageScreen(),
    );
  }
}

class ThemeAndImageScreen extends StatefulWidget {
  @override
  _ThemeAndImageScreenState createState() => _ThemeAndImageScreenState();
}

class _ThemeAndImageScreenState extends State<ThemeAndImageScreen> {
  final GenerateThemeImpl _generateThemeImpl = GenerateThemeImpl();
  String _generatedTheme = 'まだお題が生成されていません';
  String _imageDescription = '画像の説明がここに表示されます';
  File? _selectedImage;
  bool _isLoading = false; // ローディング状態を管理

  Future<void> _generateTheme() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final theme = await _generateThemeImpl.generalTheme();
      setState(() {
        _generatedTheme = theme.title;
      });
    } on ApiKeyNotFoundException catch (e) {
      _showErrorDialog(e.toString());
    } catch (e) {
      _showErrorDialog('お題の生成に失敗しました: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _imageDescription = '画像の説明がここに表示されます'; // 説明をリセット
        });
      }
    } catch (e) {
      _showErrorDialog('画像の選択に失敗しました: $e');
    }
  }

  Future<void> _describeImage() async {
    if (_selectedImage == null) {
      _showErrorDialog('まず画像を選択してください。');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final description = await _generateThemeImpl.describeImage(_selectedImage!);
      setState(() {
        _imageDescription = description;
      });
    } on ApiKeyNotFoundException catch (e) {
      _showErrorDialog(e.toString());
    } catch (e) {
      _showErrorDialog('画像の説明に失敗しました: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// エラーダイアログを表示します。
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('エラー'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('閉じる'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AIお題生成＆画像説明'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // 横幅いっぱいに広げる
              children: [
                Text('生成されたお題:', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text(_generatedTheme, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _generateTheme,
                  child: Text('お題を生成する'),
                ),
                SizedBox(height: 40),
                _selectedImage == null
                    ? Text('画像が選択されていません', style: TextStyle(fontSize: 16))
                    : Image.file(_selectedImage!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _pickImage,
                  child: Text('画像を選択'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _describeImage,
                  child: Text('画像を説明する'),
                ),
                SizedBox(height: 20),
                Text('画像の説明:', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text(_imageDescription, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
