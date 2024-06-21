import 'package:flutter/material.dart';
import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/text_styles.design.dart';
import '../widgets/icon_button.widget.dart';
import '../widgets/xo_grid.widget.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: DesignColors.background,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            XOGridWidget(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButtonWidget(
                      icon: DesignIcons.close,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    // WHAT
                    const SizedBox(height: 32),
                    Text(
                      "What",
                      style: DesignTextStyles.heading2,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Tic-tac-toe or X-O is a game for two players who take turns marking the spaces in a three-by-three grid with X or O. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.",
                      style: DesignTextStyles.text1,
                    ),

                    // How AI Works
                    const SizedBox(height: 32),
                    Text(
                      "How AI Works",
                      style: DesignTextStyles.heading2,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "The AI in game uses Minimax algorithm which enables the AI player to make optimal moves by constructing a decision tree of all possible game states. At each node, the AI evaluates the potential moves by recursively simulating future game states, assuming the AI aims to maximize its score while the human opponent aims to minimize it.",
                      style: DesignTextStyles.text1,
                    ),

                    // About Me
                    const SizedBox(height: 32),
                    Text(
                      "About Me",
                      style: DesignTextStyles.heading2,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Howdy! My name is ADII. I hope you enjoyed playing this game. Fallowing are links for quick access —",
                      style: DesignTextStyles.text1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "• GitHub Repository",
                      style: DesignTextStyles.text2.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        decorationColor: DesignColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "• Figma Designs",
                      style: DesignTextStyles.text2.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        decorationColor: DesignColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
