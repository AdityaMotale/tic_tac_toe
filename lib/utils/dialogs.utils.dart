import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/text_styles.design.dart';
import '../views/play_with_ai.view.dart';
import '../views/play_with_friend.dart';
import '../widgets/icon_button.widget.dart';

void showGamePauseDialog(
  BuildContext context, {
  required String title,
  required DesignIcons icon,
  required void Function() onTap,
}) async {
  final deviceWidth = MediaQuery.of(context).size.width;
  final deviceHeight = MediaQuery.of(context).size.height;

  await showDialog(
    context: context,
    builder: (context) => Scaffold(
      backgroundColor: DesignColors.secondary.withOpacity(0.8),
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: DesignTextStyles.heading2),
            const SizedBox(height: 32),
            IconButtonWidget(icon: icon, onTap: onTap),
          ],
        ),
      ),
    ),
  );
}

void showGameResultDialog(
  BuildContext context, {
  required String title,
  bool isPlayingWithAi = true,
}) async {
  final deviceWidth = MediaQuery.of(context).size.width;
  final deviceHeight = MediaQuery.of(context).size.height;

  await showDialog(
    context: context,
    builder: (context) => Scaffold(
      backgroundColor: DesignColors.secondary.withOpacity(0.8),
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: DesignTextStyles.heading2),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButtonWidget(
                  icon: DesignIcons.redo,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => isPlayingWithAi
                            ? const PlayWithAiView()
                            : const PlayWithFriendView(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 24),
                IconButtonWidget(
                  icon: DesignIcons.home,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
