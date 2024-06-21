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

enum _Players { player1, player2 }

class PlayWithFriendView extends StatefulWidget {
  const PlayWithFriendView({super.key});

  @override
  State<PlayWithFriendView> createState() => _PlayWithFriendViewState();
}

class _PlayWithFriendViewState extends State<PlayWithFriendView> {
  List<PlayOptions> board = [];
  late final PlayOptions player1;
  late final PlayOptions player2;
  late _Players currentPlayer;

  final GameEngine engine = GameEngine();

  void populateBoardWithEmptyValues([int size = 9]) {
    for (int i = 0; i < size; i++) {
      board.add(PlayOptions.empty);
    }
  }

  void playForPlayer(int index) {
    if (!engine.isMoveAvailable(index, board)) return;

    if (currentPlayer == _Players.player1) {
      board[index] = player1;
      currentPlayer = _Players.player2;
    } else {
      board[index] = player2;
      currentPlayer = _Players.player1;
    }

    if (engine.checkWinner(player1, board)) {
      showGameResultDialog(
        context,
        title: "Player 1 Wins :D",
        isPlayingWithAi: false,
      );
      return;
    }

    if (engine.checkWinner(player2, board)) {
      showGameResultDialog(
        context,
        title: "Player 2 Wins :D",
        isPlayingWithAi: false,
      );
      return;
    }

    if (engine.isBoardFull(board)) {
      showGameResultDialog(
        context,
        title: "Game Drawn!",
        isPlayingWithAi: false,
      );
      return;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    populateBoardWithEmptyValues();

    final randomNumber = Random().nextInt(10);

    player1 = randomNumber % 2 == 0 ? PlayOptions.o : PlayOptions.x;
    player2 = randomNumber % 2 == 0 ? PlayOptions.x : PlayOptions.o;

    currentPlayer = randomNumber % 2 == 0 ? _Players.player1 : _Players.player2;
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
                  const Expanded(flex: 2, child: SizedBox()),
                  SizedBox(
                    height: maxBoardSize + (illustrationSize * 2),
                    width: maxBoardSize,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Positioned(
                          right: 8,
                          top: 0,
                          child: Opacity(
                            opacity:
                                currentPlayer == _Players.player1 ? 1.0 : 0.25,
                            child: Column(
                              children: [
                                Text(
                                  "Player 1 - ${player1.value}",
                                  style: DesignTextStyles.body2,
                                ),
                                const SizedBox(height: 16),
                                Transform.flip(
                                  flipX: true,
                                  child: const DesignIllustration(
                                    illustrationSize: illustrationSize,
                                    illustration: DesignIllustrations.chill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          bottom: 0,
                          child: Opacity(
                            opacity:
                                currentPlayer == _Players.player2 ? 1.0 : 0.25,
                            child: Transform.flip(
                              flipY: true,
                              child: Column(
                                children: [
                                  Transform.flip(
                                    flipX: true,
                                    child: Text(
                                      "Player 2 - ${player2.value}",
                                      style: DesignTextStyles.body2,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const DesignIllustration(
                                    illustrationSize: illustrationSize,
                                    illustration: DesignIllustrations.cool,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: illustrationSize,
                          bottom: illustrationSize,
                          child: GameBoardWidget(
                            maxBoardSize: maxBoardSize,
                            board: board,
                            player1: player1,
                            player2: player2,
                            playingWithAi: false,
                            onTap: (i) {
                              playForPlayer(i);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
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
