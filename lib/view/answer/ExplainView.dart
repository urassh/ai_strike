import 'package:flutter/material.dart';

class ExplainView extends StatelessWidget {
  final Game explain;

  ExplainView({this.explain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        explain,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}