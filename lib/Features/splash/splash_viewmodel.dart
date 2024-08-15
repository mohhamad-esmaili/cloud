import 'dart:isolate';

import 'package:cloud/Core/constants/enums.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/weather_api_service.dart';
import 'package:flutter/material.dart';

class SplashViewModelProvider extends ChangeNotifier {
  ApiEnum isApiLoaded = ApiEnum.loading;
  late TodayWeatherModel todayWeatherModel;

  get getIsApiLoaded => isApiLoaded;
  get getTodayWeatherUpdated => todayWeatherModel;

  refreshApiData() async {
    List apiResponse = await WeatherApiService().getTodayWeather();
    if (apiResponse[0] == 200) {
      isApiLoaded = ApiEnum.done;
      todayWeatherModel = apiResponse[1];
    } else {
      isApiLoaded = ApiEnum.loading;
    }

    notifyListeners();
  }
}
