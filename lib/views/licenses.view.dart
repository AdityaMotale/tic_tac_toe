import 'dart:math';

import 'package:flutter/material.dart';
import 'license_detail.view.dart';

import '../design/colors.design.dart';
import '../design/icons.design.dart';
import '../design/text_styles.design.dart';
import '../oss_licenses.dart';
import '../widgets/icon_button.widget.dart';
import '../widgets/xo_grid.widget.dart';

class LicensesView extends StatelessWidget {
  const LicensesView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DesignColors.background,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            XOGridWidget(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: allDependencies.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    child: IconButtonWidget(
                      icon: DesignIcons.close,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => LicenseDetailView(
                          package: allDependencies[index - 1],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    width: min(deviceWidth - 32, 354),
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: DesignColors.secondary,
                      border: Border.all(
                        color: DesignColors.primary,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      color: DesignColors.primary,
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Text(
                            allDependencies[index - 1].name,
                            style: DesignTextStyles.body2.copyWith(
                              color: DesignColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
