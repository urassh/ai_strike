import 'package:ai_strike/datamodel/GameTheme.dart';
import 'package:flutter/material.dart';
import '../answer/StartView.dart';
import '../util/AppStyle.dart';
import 'ListViewModel.dart';
import 'ThemeListCell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeListView extends ConsumerWidget implements ThemeListCellDelegate {
  const ThemeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeList = ref.watch(themeListProvider);
    final themeListViewModel = ref.read(themeListProvider.notifier);

    Future.delayed(Duration.zero, () {
      themeListViewModel.fetchThemes();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Strike!!", style: TextStyle(fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: themeList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select a Theme',
              style: AppStyle.title,
            ),
            Text("You can challenge right swipe!!", style: AppStyle.subTitle),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: themeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ThemeListCell(theme: themeList[index], delegate: this),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeListViewModel.fetchThemes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  void onLeftSwipe(BuildContext context, GameTheme theme) {
    print("Left!");
  }

  @override
  void onRightSwipe(BuildContext context, GameTheme theme) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StartView(theme: theme)),
    );
  }

}