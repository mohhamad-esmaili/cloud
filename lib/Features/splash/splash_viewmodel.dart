import 'package:cloud/Core/constants/enums.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/weather_api_service.dart';
import 'package:flutter/material.dart';

class SplashViewModelProvider extends ChangeNotifier {
  ApiEnum isApiLoaded = ApiEnum.loading;
  bool hasError = false;

  late ForecastWeatherModel todayWeatherModel;

  get getIsApiLoaded => isApiLoaded;
  get getTodayWeatherUpdated => todayWeatherModel;

  refreshApiData(String userLocation) async {
    List apiResponse = await WeatherApiService().getTodayWeather(userLocation);

    hasError = false;

    if (apiResponse[0] == 200) {
      isApiLoaded = ApiEnum.done;
      todayWeatherModel = apiResponse[1];
      hasError = false;
    } else {
      isApiLoaded = ApiEnum.loading;
      hasError = true;
    }

    notifyListeners();
  }
}
