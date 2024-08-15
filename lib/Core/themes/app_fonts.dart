import 'package:flutter/material.dart';

extension MakeHeader on Text {
  Text makeBoldHeader1(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
          fontSize: 45,
          color: Theme.of(context).textTheme.headlineLarge!.color,
          fontWeight: FontWeight.bold,
          letterSpacing: 3),
    );
  }
}

extension MakeReqularText on Text {
  Text makeReqularText(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 25,
        color: Theme.of(context).textTheme.headlineLarge!.color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
