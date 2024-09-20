import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool showBackButton;

  const AppScaffold({super.key, required this.body, this.floatingActionButton, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("AI Strike!!", style: TextStyle(fontWeight: FontWeight.w600)),
        automaticallyImplyLeading: showBackButton,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
                color: Colors.grey.withOpacity(0.5),
                height: 1.0,
            ),
        )),
        body: body,
        floatingActionButton: floatingActionButton,
    );
  }
}