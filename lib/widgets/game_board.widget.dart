import 'dart:math';

import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/text_styles.design.dart';

enum PlayOptions {
  x("X"),
  o("O"),
  empty(" ");

  final String value;

  const PlayOptions(this.value);
}

class GameBoardWidget extends StatelessWidget {
  ///
  /// a 1D list representing the XO board,
  ///
  /// 0 -> Empty
  /// 1 -> X
  /// 2 -> O
  ///
  final List<PlayOptions> board;

  final void Function(int index) onTap;

  ///
  /// Always represents the human player
  ///
  final PlayOptions player1;

  ///
  /// Represents AI if playing w/ AI or human player if playing w/ a friend
  ///
  final PlayOptions player2;

  final bool playingWithAi;

  const GameBoardWidget({
    super.key,
    required this.board,
    required this.onTap,
    this.player1 = PlayOptions.x,
    this.player2 = PlayOptions.o,
    this.playingWithAi = true,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final double maxWidth = min(deviceWidth - 48, 354);
    final boardWidth = maxWidth - 20;

    return SizedBox(
      width: maxWidth,
      height: maxWidth,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: boardWidth,
              height: boardWidth,
              decoration: const BoxDecoration(
                color: DesignColors.primary,
              ),
            ),
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: DesignColors.primary,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: DesignColors.primary,
                  width: 2,
                ),
              ),
            ),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: board.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: DesignColors.primary,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: DesignColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      board[index].value,
                      style: DesignTextStyles.title.copyWith(
                        color: playingWithAi
                            ? board[index].value == player2.value
                                ? DesignColors.accent_1
                                : DesignColors.primary
                            : board[index].value == player2.value
                                ? DesignColors.accent_2
                                : DesignColors.accent_3,
                      ),
                      textScaler: MediaQuery.of(context).textScaler,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
