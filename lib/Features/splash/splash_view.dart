import 'package:cloud/Core/constants/app_colors.dart';
import 'package:cloud/Core/constants/app_routes.dart';
import 'package:cloud/Core/constants/enums.dart';

import 'package:cloud/Core/services/weather_api_service.dart';
import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:cloud/Features/splash/splash_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModelProvider splashProvider =
        Provider.of<SplashViewModelProvider>(context);
    splashProvider.refreshApiData();
    ApiEnum apiEnum = splashProvider.getIsApiLoaded;
    if (apiEnum.name.toString() == ApiEnum.done.name.toString()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<HomeViewmodelProvider>(context, listen: false)
            .updateTodayModel(splashProvider.getTodayWeatherUpdated);

        Navigator.of(context).pushNamedAndRemoveUntil(
            RouterConstants.homeView, (Route<dynamic> route) => false);
      });
    }
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Icon(
                    Icons.cloud,
                    color: Colors.black54,
                    size: 160,
                  ),
                  Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 150,
                  ),
                ],
              ),
              const Text("Cloud").makeBoldHeader1(context),
              InkWell(
                onTap: () => WeatherApiService().getTodayWeather(),
                child: Text("data").makeBoldHeader1(context),
              ),
              //TODO: make indicator uncomment
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
