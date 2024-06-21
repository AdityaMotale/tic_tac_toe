import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';

enum ButtonState {
  active,
  pressed,
  disabled,
}

class IconButtonWidget extends StatelessWidget {
  final DesignIcons icon;
  final void Function() onTap;
  final ButtonState state;

  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.state = ButtonState.active,
  });

  @override
  Widget build(BuildContext context) {
    const double stackWidth = 40;
    const double offset = 4;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: stackWidth,
        height: stackWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              width: stackWidth - offset,
              height: stackWidth - offset,
              color: DesignColors.primary,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              left: state == ButtonState.active ? offset : 0,
              bottom: state == ButtonState.active ? offset : 0,
              child: Container(
                height: stackWidth - offset,
                width: stackWidth - offset,
                padding: const EdgeInsets.all(offset / 2),
                decoration: BoxDecoration(
                  color: DesignColors.secondary,
                  border: Border.all(color: DesignColors.primary, width: 2),
                ),
                child: Container(
                  color: state == ButtonState.disabled
                      ? DesignColors.secondaryBackground
                      : DesignColors.primary,
                  child: Center(
                    child: Image.asset(icon.path),
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
