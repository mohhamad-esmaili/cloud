import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/constants/weatherapi_key.dart';

// sending request to api and get data
class WeatherApiService {
  Future getTodayWeather(String userLocation) async {
    // instead of `WeatherapiKey.apiKey` you need pass your apikey
    final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?q=$userLocation&days=14&aqi=yes&key=${WeatherapiKey.apiKey}");
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ForecastWeatherModel tModel = ForecastWeatherModel.fromJson(data);
        return [response.statusCode, tModel];
      } else {
        return [response.statusCode];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
