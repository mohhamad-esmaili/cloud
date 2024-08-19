
import 'package:cloud/Core/constants/enums.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/icon_gen_service.dart';
import 'package:cloud/Core/services/weather_api_service.dart';

import 'package:flutter/material.dart';

class HomeViewmodelProvider extends ChangeNotifier {
  late ForecastWeatherModel _todayWeatherModel;
  String weatherIcon = "";
  ApiEnum isApiLoaded = ApiEnum.loading;
  bool _isLoading = false;
  String _errorString = "";
  get errorString => _errorString;
  get isLoading => _isLoading;
  final TextEditingController _locationTextController = TextEditingController();

  get getTodayWeather => _todayWeatherModel;
  get getLocationController => _locationTextController;

  void setWeatherIcon(String iconString) =>
      _todayWeatherModel.current!.condition!.icon = iconString;

  void updateTodayModel(ForecastWeatherModel updatedModel) {
    _todayWeatherModel = updatedModel;
    setWeatherIcon(changeIconGeneratorService(
        isNight: _todayWeatherModel.current!.isDay!,
        apiCondition: _todayWeatherModel.current!.condition!.text!));
    notifyListeners();
  }

  refreshWeatherWithLocation(String userLocation) async {
    isApiLoaded = ApiEnum.loading;
    _isLoading = true;
    notifyListeners();
    if (userLocation.isEmpty) {
      userLocation = "Tehran";
    }
    List apiResponse = await WeatherApiService().getTodayWeather(userLocation);
    _errorString = "";
    if (apiResponse[0] == 200) {
      _isLoading = false;
      isApiLoaded = ApiEnum.done;
      _todayWeatherModel = apiResponse[1];
    } else if (apiResponse[0] == 400) {
      isApiLoaded = ApiEnum.loading;
      _isLoading = true;
      _errorString = "there is no such a location, try again";
    } else {
      _errorString = "Loading";
      isApiLoaded = ApiEnum.loading;
    }

    notifyListeners();
  }
}
