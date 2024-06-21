import 'dart:math';

import 'package:flutter/material.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/text_styles.design.dart';
import '../oss_licenses.dart';
import '../widgets/icon_button.widget.dart';

class LicenseDetailView extends StatelessWidget {
  final Package package;

  const LicenseDetailView({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.background,
      body: Center(
        child: Container(
          width: min(MediaQuery.of(context).size.width, 800),
          padding: const EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButtonWidget(
                  icon: DesignIcons.close,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 32),
                Text(
                  package.name,
                  style: DesignTextStyles.heading1,
                ),
                const SizedBox(height: 32),
                Text(
                  "v. ${package.version}",
                  style: DesignTextStyles.body1,
                ),
                const SizedBox(height: 16),
                Text(
                  package.description,
                  style: DesignTextStyles.body2,
                ),
                const SizedBox(height: 24),
                Text(
                  package.license ?? "unknown license",
                  style: DesignTextStyles.text1,
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
