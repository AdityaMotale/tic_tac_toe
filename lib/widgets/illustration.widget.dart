import 'dart:math';

import 'package:flutter/material.dart';

import '../design/illustrations.design.dart';

class DesignIllustration extends StatelessWidget {
  final DesignIllustrations illustration;

  const DesignIllustration({
    super.key,
    required this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    final double width = min(MediaQuery.of(context).size.width - 48, 354);

    return SizedBox(
      width: width,
      height: width,
      child: Image.asset(illustration.path, fit: BoxFit.cover),
    );
  }
}
