import 'package:cloud/Core/constants/app_layout.dart';
import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class GridItamWidget extends StatelessWidget {
  final String title;
  final Widget middleWidget;
  final Widget subWidget;
  const GridItamWidget({
    super.key,
    required this.title,
    required this.middleWidget,
    required this.subWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: AppLayout().weatherCardDecoration(context),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title).makeFadedReqularText(context),
            const SizedBox(height: 20),
            Center(child: middleWidget),
            const MaxGap(10),
            subWidget
          ],
        ),
      ),
    );
  }
}
