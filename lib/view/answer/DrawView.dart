import 'package:ai_strike/view/components/AppScaffold.dart';
import 'package:ai_strike/view/components/ThemeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/GradationContainer.dart';
import '../util/AppStyle.dart';
import 'AnswerViewModel.dart';
import 'ExplainView.dart';

class DrawView extends ConsumerStatefulWidget implements TimerDelegate {
  const DrawView({super.key});

  @override
  _DrawViewState createState() => _DrawViewState();

  @override
  void onStopTimer(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerProvider);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ExplainView(description: state.answer.description)
      ),
    );
  }
}

class _DrawViewState extends ConsumerState<DrawView> {
  List<Offset?> points = []; // 描画するポイントのリスト

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(answerProvider);
    final answerViewModel = ref.read(answerProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      answerViewModel.startTimer(widget, context, ref);
    });

    return AppScaffold(
      showBackButton: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text("${state.time}s", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              ),
              Text(
                'Theme',
                style: AppStyle.title,
              ),
              const SizedBox(height: 8),
              Center(
                child: FractionallySizedBox(
                    widthFactor: 1.0, child: ThemeCard(delegate: state.answer.theme)),
              ),
              const SizedBox(height: 10),
              Text(
                'Draw it',
                style: AppStyle.title,
              ),
              const SizedBox(height: 10),

              // 描画エリア
              GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },
                onPanEnd: (details) {
                  points.add(null);
                },
                child: GradationContainer(
                  height: 400,
                  child: CustomPaint(
                    painter: PaintCanvas(points),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class PaintCanvas extends CustomPainter {
  final List<Offset?> points;

  PaintCanvas(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint); // 線を描く
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
