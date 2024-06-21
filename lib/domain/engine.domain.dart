import 'dart:math';

import '../widgets/game_board.widget.dart';

class GameEngine {
  ///
  /// checks if there is any winner in the game
  ///
  bool checkWinner(PlayOptions player, List<PlayOptions> board) {
    List<List<int>> winConditions = [
      [0, 1, 2], // Horizontal
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6], // Vertical
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8], // Diagonal
      [2, 4, 6],
    ];

    for (var condition in winConditions) {
      if (board[condition[0]] == player &&
          board[condition[1]] == player &&
          board[condition[2]] == player) {
        return true;
      }
    }

    return false;
  }

  bool isMoveAvailable(int move, List<PlayOptions> board) {
    if (move > board.length) return false;

    return board[move] == PlayOptions.empty;
  }

  ///
  /// fetch the list of indexes of available moves from the board
  ///
  List<int> availableMoves(List<PlayOptions> board) {
    List<int> moves = [];

    for (int i = 0; i < board.length; i++) {
      if (board[i] == PlayOptions.empty) {
        moves.add(i);
      }
    }

    return moves;
  }

  bool isBoardFull(List<PlayOptions> board) {
    return !board.contains(PlayOptions.empty);
  }

  ///
  /// find the best move to play by the AI
  ///
  int minimax(
    List<PlayOptions> board, {
    required PlayOptions aiPlayer,
    required PlayOptions opponentPlayer,
    int depth = 0,
    bool isMaximizing = true,
  }) {
    if (checkWinner(aiPlayer, board)) {
      return 10 - depth;
    } else if (checkWinner(opponentPlayer, board)) {
      return depth - 10;
    } else if (isBoardFull(board)) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;

      for (var move in availableMoves(board)) {
        board[move] = aiPlayer;

        int score = minimax(
          board,
          aiPlayer: aiPlayer,
          opponentPlayer: opponentPlayer,
          depth: depth + 1,
          isMaximizing: false,
        );

        board[move] = PlayOptions.empty;
        bestScore = max(score, bestScore);
      }

      return bestScore;
    } else {
      int bestScore = 1000;

      for (var move in availableMoves(board)) {
        board[move] = opponentPlayer;

        int score = minimax(
          board,
          aiPlayer: aiPlayer,
          opponentPlayer: opponentPlayer,
          depth: depth + 1,
          isMaximizing: true,
        );

        board[move] = PlayOptions.empty;
        bestScore = min(score, bestScore);
      }

      return bestScore;
    }
  }

  int? playAiMove(
    List<PlayOptions> board, {
    required PlayOptions aiPlayer,
  }) {
    int bestScore = -1000;
    int? bestMove;
    final opponentPlayer =
        aiPlayer == PlayOptions.x ? PlayOptions.o : PlayOptions.x;

    for (var move in availableMoves(board)) {
      board[move] = aiPlayer;

      final int score = minimax(
        board,
        aiPlayer: aiPlayer,
        opponentPlayer: opponentPlayer,
        depth: 0,
        isMaximizing: false,
      );

      board[move] = PlayOptions.empty;

      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }

    return bestMove;
  }
}
