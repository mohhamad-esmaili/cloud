import 'dart:convert';
import 'package:cloud/Core/constants/enums.dart';
import 'package:cloud/Core/constants/weatherapi_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud/Core/data/weather_model.dart';

class WeatherApiService {
  Future getTodayWeather() async {
    // آدرس URL و کلید API
    final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?q=tehran&key=${WeatherapiKey.apiKey}");

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      TodayWeatherModel tModel = TodayWeatherModel.fromJson(data);

      return [response.statusCode, tModel];
    } else {
      print('Request failed with status: ${response.statusCode}');
      return [response.statusCode];
    }
  }
}
