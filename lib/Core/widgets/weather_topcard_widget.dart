import 'package:cloud/Core/constants/app_layout.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/services/dateformater.dart';
import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Core/widgets/divider_line_widget.dart';
import 'package:cloud/Core/widgets/weathertemp_widget.dart';
import 'package:cloud/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherTopcardWidget extends StatelessWidget {
  final ForecastWeatherModel todayWeather;
  final Size deviceSize;
  const WeatherTopcardWidget({
    super.key,
    required this.todayWeather,
    required this.deviceSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: deviceSize.width,
      decoration: AppLayout().weatherCardDecoration(context),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  todayWeather.current!.condition!.icon!,
                  color: Theme.of(context).listTileTheme.titleTextStyle!.color,
                  height: deviceSize.height / 4,
                  // height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todayWeather.location!.name!,
                    ).makeHeader2(context),
                    Text(todayWeather.location!.country!)
                        .makeReqularText(context),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeathertempWidget(todayWeather.current!.feelslikeC!),
                Row(
                  children: [
                    Text(
                      "${DateFormaterService().getFullDay(todayWeather.location!.localtime!)},",
                    ).makeBoldHeader3(context),
                    const SizedBox(width: 5),
                    Text(
                      DateFormaterService()
                          .getDayHour(todayWeather.location!.localtime!),
                    ).makeFadedReqularText(context),
                  ],
                ),
                const DividerlineWidget(),
                SizedBox(
                  width: deviceSize.height / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todayWeather.current!.condition!.text!,
                        textAlign: TextAlign.justify,
                      ).makeBoldHeader3(context),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.wiSprinkle,
                      color:
                          Theme.of(context).listTileTheme.titleTextStyle!.color,
                    ),
                    Text("Rain - ${todayWeather.forecast!.forecastday![0].day!.dailyChanceOfRain}%")
                        .makeSubText(context),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
