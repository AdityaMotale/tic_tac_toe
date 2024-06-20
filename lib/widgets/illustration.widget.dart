import 'package:flutter/material.dart';

import '../design/illustrations.design.dart';

class DesignIllustration extends StatelessWidget {
  final DesignIllustrations illustration;
  final double illustrationSize;

  const DesignIllustration({
    super.key,
    required this.illustration,
    required this.illustrationSize,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: illustrationSize,
      height: illustrationSize,
      child: Image.asset(
        illustration.path,
        fit: BoxFit.cover,
      ),
    );
  }
}
