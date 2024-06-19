import 'package:flutter/material.dart';
import 'package:tic_tac_toe/design/illustrations.design.dart';
import 'package:tic_tac_toe/widgets/illustration.widget.dart';
import '../design/icons.design.dart';
import '../widgets/icon_button.widget.dart';

import '../design/colors.design.dart';
import '../widgets/button.widget.dart';
import '../widgets/xo_grid.widget.dart';

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
                const DesignIllustration(
                  illustration: DesignIllustrations.cool,
                ),
                const SizedBox(height: 100),
                IconButtonWidget(icon: DesignIcons.close, onTap: () {}),
                const SizedBox(height: 100),
                ButtonWidget(title: "Button Text", onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
