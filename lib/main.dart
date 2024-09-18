import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'model/theme/generateThemeImpl.dart';

void main() async {
  // .envファイルを読み込む
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: GenerateThemeImpl().generalTheme(), // GenerateThemeImplを呼び出す
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // データ取得中のインジケータ
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // エラーメッセージ表示
            } else {
              return Text(
                'Generated Theme: ${snapshot.data?.title ?? "No theme"}', // 生成されたテーマを表示
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 必要に応じて追加機能を実装
          });
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
