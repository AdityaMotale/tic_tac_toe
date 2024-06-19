import 'dart:math';

import 'package:flutter/material.dart';
import '../design/colors.design.dart';
import '../design/text_styles.design.dart';

enum ButtonState {
  active,
  pressed,
  disabled,
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final ButtonState state;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.state = ButtonState.active,
  });

  @override
  Widget build(BuildContext context) {
    final double stackWidth = min(MediaQuery.of(context).size.width - 48, 354);
    const double stackHeight = 66;
    const double offset = 8;

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: stackWidth,
        height: stackHeight,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              width: stackWidth - offset,
              height: stackHeight - offset,
              color: DesignColors.primary,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              left: state == ButtonState.active ? offset : 0,
              bottom: state == ButtonState.active ? offset : 0,
              child: Container(
                height: stackHeight - offset,
                width: stackWidth - offset,
                padding: const EdgeInsets.all(offset / 2),
                decoration: BoxDecoration(
                  color: DesignColors.secondary,
                  border: Border.all(
                    color: DesignColors.primary,
                    width: 2,
                  ),
                ),
                child: Container(
                  color: state == ButtonState.disabled
                      ? DesignColors.secondaryBackground
                      : DesignColors.primary,
                  child: Center(
                    child: Text(
                      title,
                      style: DesignTextStyles.body1.copyWith(
                        color: state == ButtonState.disabled
                            ? DesignColors.primary
                            : DesignColors.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
