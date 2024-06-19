import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/text_styles.design.dart';

///
/// Widget that draws the XO grid on the screen,
///
/// Grid is drawn on the whole screen with 80 * 80 tile layout
///
class XOGridWidget extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;

  const XOGridWidget({
    required this.deviceWidth,
    required this.deviceHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(deviceWidth, deviceHeight),
      painter: _BgGridPainter(
        deviceWidth: deviceWidth,
        deviceHeight: deviceHeight,
      ),
    );
  }
}

class _BgGridPainter extends CustomPainter {
  final double deviceWidth;
  final double deviceHeight;

  _BgGridPainter({
    required this.deviceHeight,
    required this.deviceWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    ///
    /// No of items in row and col are calculated w/ help of device height and
    /// width, dividing the adjusted number (+40) gives us the number of items
    /// in a row or column
    ///
    /// Every character is drawn in 80 * 80 square grid
    ///
    /// 40 is added to make the grid look infinite and overflow half of square
    /// on the edge
    ///
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
          style: DesignTextStyles.heading1.copyWith(
            color: DesignColors.secondaryBackground,
          ),
        );

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(minWidth: 0, maxWidth: 80);

        ///
        /// The layout offset starts from (-20, -36) represented as (x,y)
        ///
        textPainter.paint(canvas, Offset((row * 80) - 20, (col * 80) - 20));
      }
    }
  }

  @override
  // does not need to repaint the widget cause canvas will never be mutated
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
