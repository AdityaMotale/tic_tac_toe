import 'dart:math';

import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/illustrations.design.dart';
import '../design/text_styles.design.dart';
import '../widgets/game_board.widget.dart';
import '../widgets/illustration.widget.dart';

class PlayWithAiView extends StatefulWidget {
  const PlayWithAiView({super.key});

  @override
  State<PlayWithAiView> createState() => _PlayWithAiViewState();
}

class _PlayWithAiViewState extends State<PlayWithAiView> {
  List<PlayOptions> board = [];

  void populateBoardWithEmptyValues([int size = 9]) {
    for (int i = 0; i < size; i++) {
      board.add(PlayOptions.empty);
    }
  }

  @override
  void initState() {
    super.initState();

    populateBoardWithEmptyValues();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final double maxBoardSize = min(deviceWidth - 48, 354);
    const double illustrationSize = 104;

    return Scaffold(
      backgroundColor: DesignColors.background,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              width: deviceWidth,
              height: deviceHeight,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    height: maxBoardSize + illustrationSize,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "You - X",
                                    style: DesignTextStyles.body2,
                                  ),
                                  const SizedBox(height: 16),
                                  const DesignIllustration(
                                    illustrationSize: illustrationSize,
                                    illustration: DesignIllustrations.excited,
                                  ),
                                ],
                              ),
                              Opacity(
                                opacity: 0.25,
                                child: Column(
                                  children: [
                                    Text(
                                      "You - O",
                                      style: DesignTextStyles.body2,
                                    ),
                                    const SizedBox(height: 16),
                                    Transform.flip(
                                      flipX: true,
                                      child: const DesignIllustration(
                                        illustrationSize: illustrationSize,
                                        illustration:
                                            DesignIllustrations.serious,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: illustrationSize,
                          child: GameBoardWidget(
                            maxBoardSize: maxBoardSize,
                            board: const [
                              PlayOptions.empty,
                              PlayOptions.empty,
                              PlayOptions.x,
                              PlayOptions.empty,
                              PlayOptions.o,
                              PlayOptions.empty,
                              PlayOptions.x,
                              PlayOptions.empty,
                              PlayOptions.o,
                            ],
                            onTap: (i) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text("X", style: DesignTextStyles.heading2),
                  const SizedBox(height: 32),
                  Text("Your Move", style: DesignTextStyles.body1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
