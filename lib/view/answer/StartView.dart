

import 'package:flutter/material.dart';

import '../util/AppTextStyle.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Theme',
              style: AppTextStyle.title,
            ),
            Text("You can challenge right swipe!!", style: AppTextStyle.subTitle),
            const SizedBox(height: 16),
            const Text("StartView"),
          ],
        ),
      ),
    );
  }
}