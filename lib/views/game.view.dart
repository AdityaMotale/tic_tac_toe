import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: deviceWidth - (32 * 2),
              height: deviceWidth - (32 * 2),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: deviceWidth - (37 * 2),
                      height: deviceWidth - (37 * 2),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0c0c0c),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: deviceWidth - (37 * 2),
                      height: deviceWidth - (37 * 2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(color: Color(0xFF0c0c0c)),
                          bottom: BorderSide(color: Color(0xFF0c0c0c)),
                        ),
                      ),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0xFF0c0c0c)),
                                right: BorderSide(color: Color(0xFF0c0c0c)),
                              ),
                            ),
                            child: const Text(
                              'X',
                              style: TextStyle(
                                color: Color(0xFF0c0c0c),
                                fontFamily: "Array",
                                fontSize: 72,
                                height: 1,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
