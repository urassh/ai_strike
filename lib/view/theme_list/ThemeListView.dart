import 'package:flutter/material.dart';

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
                      _ThemeListCell(),
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

class _ThemeListCell extends StatelessWidget {
  const _ThemeListCell({super.key});

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA9C9FF),
            Color(0xFFFFBBEC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.white.withAlpha(100),
          width: 4.0,
        ),
      ),
      child: ListTile(
        leading: const Icon(Icons.label, color: Colors.white), // Change icon color if needed
        title: Text(
            'サンプルのお題',
            style: _titleStyle,
        ),
        subtitle: const Text(
          '2022/12/31 23:59',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
