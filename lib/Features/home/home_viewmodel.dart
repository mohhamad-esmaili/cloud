import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/icon_gen_service.dart';

import 'package:flutter/material.dart';

class HomeViewmodelProvider extends ChangeNotifier {
  late TodayWeatherModel _todayWeatherModel;

  get getTodayWeather => _todayWeatherModel;

  void updateTodayModel(TodayWeatherModel updatedModel) {
    _todayWeatherModel = updatedModel;
    changeIconGenerator(_todayWeatherModel.current!.condition!.icon!,
        _todayWeatherModel.current!.condition!.text!);
  }
}
