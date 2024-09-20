import 'package:flutter/material.dart';
import 'ThemeListCell.dart';

class ThemeListView extends StatelessWidget {
  const ThemeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Strike!!", style: TextStyle(fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.5), // 薄いボーダーの色
            height: 1.0, // ボーダーの高さ
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // タイトルを左揃えに
          children: <Widget>[
            const Text(
              'Select a Theme',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ), // タイトルを追加
            const SizedBox(height: 16), // タイトルとリストの間にスペースを追加
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return const Column(
                    children: <Widget>[
                      ThemeListCell(theme: null),
                      SizedBox(height: 8),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed function here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
