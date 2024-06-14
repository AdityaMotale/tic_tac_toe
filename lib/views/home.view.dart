import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(deviceWidth, deviceHeight),
            painter: BgGridPainter(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class BgGridPainter extends CustomPainter {
  final double deviceWidth;
  final double deviceHeight;

  BgGridPainter({
    required this.deviceHeight,
    required this.deviceWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int col = 0; col < (deviceHeight + 40) / 80; col++) {
      for (int row = 0; row < (deviceWidth + 40) / 80; row++) {
        final textSpan = TextSpan(
          text: (col % 2 == 0)
              ? (row % 2 == 0)
                  ? "X"
                  : "O"
              : (row % 2 == 0)
                  ? "O"
                  : "X",
          style: const TextStyle(
            fontFamily: "Array",
            fontSize: 52,
            fontWeight: FontWeight.w400,
            color: Color(0x190C0C0C),
          ),
        );

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(minWidth: 0, maxWidth: 80);

        textPainter.paint(
          canvas,
          Offset((row * 80) - 20, (col * 88) - 36),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
