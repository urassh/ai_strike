import 'package:flutter/material.dart';

import '../../datamodel/GameTheme.dart';
import '../components/GradationContainer.dart';
import '../util/AppStyle.dart';

class AnswerCard extends StatelessWidget {
  final GameTheme theme;

  const AnswerCard({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return GradationContainer(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87.withAlpha(100),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: [
                      Text(
                        'urassh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "41pt",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is the answer to the question.',
                    style: AppStyle.subTitle.copyWith(color: Colors.white).copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
