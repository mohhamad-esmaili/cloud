import 'package:cloud/Core/constants/app_layout.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/dateformater.dart';
import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Features/forecast/forecast_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCardWidget extends StatelessWidget {
  final ForecastWeatherModel todayWeather;

  const WeatherCardWidget({super.key, required this.todayWeather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 14,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Forecastday forecast = todayWeather.forecast!.forecastday![index];
          return InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ForecastView(
                    todayWeather: todayWeather.forecast!.forecastday![index]),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Container(
                width: 75,
                decoration: AppLayout().weatherCardDecoration(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getToday(index, context, forecast.date!),
                    SvgPicture.asset(
                      forecast.day!.condition!.icon!,
                      color:
                          Theme.of(context).listTileTheme.titleTextStyle!.color,
                      height: 35,
                      // height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("°${forecast.day!.mintempC!.round()}")
                            .makeSubText(context),
                        const SizedBox(width: 5),
                        Text("°${forecast.day!.maxtempC!.round()}")
                            .makeSubTextFaded(context),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getToday(index, context, String dayText) {
    if (index == 0) {
      return const Text("Today").makeSmallTitle(context);
    }
    return Text(DateFormaterService().getThreeDayLetter(dayText))
        .makeSmallTitle(context);
  }
}
