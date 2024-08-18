import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/widgets/indicator/radial_progress_painter.dart';

class MyProgressIndicator extends StatefulWidget {
  const MyProgressIndicator(
      {super.key, required this.hight, required this.width});
  final double hight;
  final double width;

  @override
  State<MyProgressIndicator> createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  int maxDuration = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232424),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Container(
                height: widget.hight,
                width: widget.width,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomPaint(
                        painter: RadialProgressPainter(
                      value: _controller.value * maxDuration,
                      backgroundGradientColors: [Colors.red, Colors.purple],
                      minValue: 0,
                      maxValue: maxDuration.toDouble(),
                    )),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
