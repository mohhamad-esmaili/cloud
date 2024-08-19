import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud/Core/constants/app_colors.dart';
import 'package:cloud/Features/setting_provider.dart';

// in this class we manage containers color and ...
class AppLayout {
  bool _getIsDarkMode(BuildContext context) =>
      Provider.of<SettingProvider>(context).isDarkMode;

  EdgeInsets weatherCardPadding = const EdgeInsets.all(20);

  BoxDecoration weatherCardDecoration(context) =>
      BoxDecoration(
          gradient: _getIsDarkMode(context)
              ? const LinearGradient(
                  colors: [Color(0xff7D7F82), Color(0xff4E5257)])
              : const LinearGradient(colors: [
                  AppColors.lightContainerbackgroundColor,
                  AppColors.lightContainerbackgroundColor
                ]),
          color: _getIsDarkMode(context)
              ? AppColors.lightContainerbackgroundColor.withOpacity(0.7)
              : AppColors.darkContainerbackgroundColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1), offset: const Offset(2, 2))
          ]);
}
