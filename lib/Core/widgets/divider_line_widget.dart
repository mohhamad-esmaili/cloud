import 'package:flutter/material.dart';

class DividerlineWidget extends StatelessWidget {
  const DividerlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: 1,
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      width: double.infinity,
    );
  }
}
