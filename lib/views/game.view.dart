import 'dart:math';

import 'package:flutter/material.dart';
import '../design/colors.design.dart';
import '../widgets/game_board.widget.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final randomNumber = Random().nextInt(10);

    return Scaffold(
      backgroundColor: DesignColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GameBoardWidget(
              board: const [
                PlayOptions.empty,
                PlayOptions.x,
                PlayOptions.empty,
                PlayOptions.x,
                PlayOptions.empty,
                PlayOptions.o,
                PlayOptions.empty,
                PlayOptions.o,
                PlayOptions.empty,
              ],
              onTap: (index) {},
              player1: randomNumber % 2 == 0 ? PlayOptions.o : PlayOptions.x,
              player2: randomNumber % 2 == 0 ? PlayOptions.x : PlayOptions.o,
              playingWithAi: false,
            ),
          ),
        ],
      ),
    );
  }
}
