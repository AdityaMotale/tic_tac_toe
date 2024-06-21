import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/text_styles.design.dart';
import '../widgets/button.widget.dart';
import '../widgets/icon_button.widget.dart';
import '../widgets/xo_grid.widget.dart';
import 'about.view.dart';
import 'licenses.view.dart';
import 'play_with_ai.view.dart';
import 'play_with_friend.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DesignColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          XOGridWidget(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            width: deviceWidth,
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(child: SizedBox()),
                if (deviceHeight > 1000) const Expanded(child: SizedBox()),
                Text(
                  "tic",
                  style: DesignTextStyles.title.copyWith(fontSize: 76),
                ),
                Text(
                  "tac",
                  style: DesignTextStyles.title.copyWith(fontSize: 96),
                ),
                Text(
                  "toe",
                  style: DesignTextStyles.title.copyWith(fontSize: 112),
                ),
                const Expanded(child: SizedBox()),
                Text("Select Mode", style: DesignTextStyles.body2),
                const SizedBox(height: 36),
                ButtonWidget(
                  title: "Single Player",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PlayWithAiView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  title: "Play With A Friend",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PlayWithFriendView(),
                      ),
                    );
                  },
                ),
                if (deviceHeight > 1000) const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            width: deviceWidth,
            height: deviceHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButtonWidget(
                  icon: DesignIcons.stack,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LicensesView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                IconButtonWidget(
                  icon: DesignIcons.info,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AboutView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
