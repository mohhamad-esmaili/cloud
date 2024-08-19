import 'package:cloud/Core/themes/app_fonts.dart';

import 'package:flutter/material.dart';

class WeathertempWidget extends StatelessWidget {
  final num tempString;

  const WeathertempWidget(this.tempString, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tempString.round().toString()).makeBoldHeader1(context),
        const Text("°C").makeHeader2(context),
      ],
    );
  }
}
