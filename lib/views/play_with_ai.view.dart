import 'dart:math';

import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/illustrations.design.dart';
import '../design/text_styles.design.dart';
import '../domain/engine.domain.dart';
import '../utils/dialogs.utils.dart';
import '../widgets/game_board.widget.dart';
import '../widgets/icon_button.widget.dart';
import '../widgets/illustration.widget.dart';

enum _Players { ai, human }

class PlayWithAiView extends StatefulWidget {
  const PlayWithAiView({super.key});

  @override
  State<PlayWithAiView> createState() => _PlayWithAiViewState();
}

class _PlayWithAiViewState extends State<PlayWithAiView> {
  List<PlayOptions> board = [];
  late final PlayOptions humanPlayer;
  late final PlayOptions aiPlayer;

  final GameEngine engine = GameEngine();

  _Players currentPlayer = _Players.human;

  void populateBoardWithEmptyValues([int size = 9]) {
    for (int i = 0; i < size; i++) {
      board.add(PlayOptions.empty);
    }
  }

  void playForPlayer(int index) {
    if (currentPlayer == _Players.ai) {
      return;
    }

    if (!engine.isMoveAvailable(index, board)) return;

    board[index] = humanPlayer;
    currentPlayer = _Players.ai;

    if (engine.checkWinner(humanPlayer, board)) {
      showGameResultDialog(context, title: "You Win :)");
      return;
    }

    if (engine.isBoardFull(board)) {
      showGameResultDialog(context, title: "Game Drawn!");
      return;
    }

    setState(() {});

    Future.delayed(const Duration(milliseconds: 1000), () {
      playForAI();
    });
  }

  void playForAI() {
    if (engine.isBoardFull(board)) {
      return;
    }

    final aiMove = engine.playAiMove(board, aiPlayer: aiPlayer);

    if (aiMove != null) {
      board[aiMove] = aiPlayer;
      currentPlayer = _Players.human;

      setState(() {});

      if (engine.checkWinner(aiPlayer, board)) {
        showGameResultDialog(context, title: "You Loose :(");
      }
    }
  }

  @override
  void initState() {
    super.initState();

    populateBoardWithEmptyValues();

    final randomNumber = Random().nextInt(100);

    humanPlayer = randomNumber % 2 == 0 ? PlayOptions.o : PlayOptions.x;
    aiPlayer = randomNumber % 2 == 0 ? PlayOptions.x : PlayOptions.o;
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
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 48,
              ),
              width: deviceWidth,
              height: deviceHeight,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: maxBoardSize,
                    height: maxBoardSize + illustrationSize,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Opacity(
                                opacity: currentPlayer == _Players.human
                                    ? 1.0
                                    : 0.25,
                                child: Column(
                                  children: [
                                    Text(
                                      "You - ${humanPlayer.value}",
                                      style: DesignTextStyles.body2,
                                    ),
                                    const SizedBox(height: 16),
                                    const DesignIllustration(
                                      illustrationSize: illustrationSize,
                                      illustration: DesignIllustrations.excited,
                                    ),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity:
                                    currentPlayer == _Players.ai ? 1.0 : 0.25,
                                child: Column(
                                  children: [
                                    Text(
                                      "Game AI - ${aiPlayer.value}",
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
                            board: board,
                            player1: humanPlayer,
                            player2: aiPlayer,
                            onTap: (i) {
                              playForPlayer(i);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    currentPlayer == _Players.ai
                        ? aiPlayer.value
                        : humanPlayer.value,
                    style: DesignTextStyles.heading2.copyWith(
                      color: currentPlayer == _Players.ai
                          ? DesignColors.accent_1
                          : DesignColors.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    currentPlayer == _Players.ai ? "AI's Move" : "Your Move",
                    style: DesignTextStyles.body1,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              width: deviceWidth,
              height: deviceHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButtonWidget(
                      icon: DesignIcons.close,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 12),
                  IconButtonWidget(
                    icon: DesignIcons.pause,
                    onTap: () {
                      showGamePauseDialog(
                        context,
                        title: "Game Paused",
                        icon: DesignIcons.play,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
