import 'package:cloud/Core/constants/app_colors.dart';
import 'package:cloud/Features/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension MakeHeader on Text {
  bool _getIsDarkMode(BuildContext context) =>
      Provider.of<SettingProvider>(context).isDarkMode;

  Text makeBoldHeader1(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
          fontSize: 55,
          color: _getIsDarkMode(context)
              ? AppColors.lightTextColor
              : AppColors.darkTextColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 3),
    );
  }

  Text makeHeader1(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
          fontSize: 35,
          color: _getIsDarkMode(context)
              ? AppColors.lightTextColor
              : AppColors.darkTextColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 2),
    );
  }

  Text makeHeader2(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 25,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeBoldHeader2(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 25,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text makeBoldHeader3(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 20,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeReqularText(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 15,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeFadedReqularText(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 15,
        color: _getIsDarkMode(context)
            ? AppColors.darkTextColor
            : AppColors.darkFadedTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeSubText(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 15,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeSmallTitle(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 15,
        color: _getIsDarkMode(context)
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text makeSubTextFaded(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 15,
        color: _getIsDarkMode(context)
            ? AppColors.darkFadedTextColor
            : AppColors.darkTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
