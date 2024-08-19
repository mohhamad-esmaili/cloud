import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/constants/app_layout.dart';
import 'package:cloud/Core/services/weather_helper.dart';
import 'package:cloud/Core/widgets/weather_topcard_widget.dart';

import 'package:cloud/Features/setting_provider.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:cloud/Features/home/widgets/uv_painter.dart';
import 'package:cloud/Features/home/widgets/grid_itam_widget.dart';
import 'package:cloud/Features/home/widgets/weathercard_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewmodelProvider homeViewmodelProvider =
        Provider.of<HomeViewmodelProvider>(context);
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    ForecastWeatherModel todayWeather = homeViewmodelProvider.getTodayWeather;
    Size deviceSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: AppLayout().weatherCardDecoration(context),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller:
                                  homeViewmodelProvider.getLocationController,
                              style: Theme.of(context)
                                  .listTileTheme
                                  .titleTextStyle,
                              decoration: InputDecoration(
                                hintText: "Search Your Location",
                                hintStyle: Theme.of(context)
                                    .listTileTheme
                                    .titleTextStyle,
                                icon: Icon(
                                  Icons.location_on_rounded,
                                  color: Theme.of(context)
                                      .listTileTheme
                                      .titleTextStyle!
                                      .color,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onSubmitted: (value) => homeViewmodelProvider
                                  .refreshWeatherWithLocation(value)),
                        ),
                        IconButton(
                            onPressed: () => settingProvider.toggleThemeMode(),
                            icon: settingProvider.isDarkMode
                                ? const Icon(Icons.light_mode_rounded,
                                    color: Colors.amber)
                                : const Icon(
                                    Icons.dark_mode_rounded,
                                    color: Colors.black,
                                  )),
                      ],
                    ),
                  ),
                  homeViewmodelProvider.isLoading
                      ? Container(
                          height: 70,
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration:
                              AppLayout().weatherCardDecoration(context),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .listTileTheme
                                        .titleTextStyle!
                                        .color,
                                  )),
                              const MaxGap(10),
                              Text(
                                homeViewmodelProvider.errorString,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                      : const SizedBox(),
                  WeatherTopcardWidget(
                      todayWeather: todayWeather, deviceSize: deviceSize),
                  WeatherCardWidget(
                    todayWeather: todayWeather,
                  ),
                  GridView.count(
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                    physics:
                        const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true,
                    children: <Widget>[
                      GridItamWidget(
                        title: "UV Index",
                        middleWidget: CustomPaint(
                          size: const Size(100, 50), // اندازه نیم دایره
                          painter: SemiCirclePainter(
                              value: todayWeather.current!.uv!, maxValue: 12),
                        ),
                        subWidget: Center(
                          child:
                              Text(todayWeather.current!.uv!.round().toString())
                                  .makeHeader2(context),
                        ),
                      ),
                      GridItamWidget(
                          title: "Wind Status",
                          middleWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(todayWeather.current!.windKph.toString())
                                  .makeHeader1(context),
                              const MaxGap(5),
                              const Text("km/h").makeBoldHeader3(context),
                            ],
                          ),
                          subWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.air_sharp,
                                color: Theme.of(context)
                                    .listTileTheme
                                    .titleTextStyle!
                                    .color,
                              ),
                              const MaxGap(5),
                              Text(todayWeather.current!.windDir!)
                                  .makeSubText(context),
                            ],
                          )),
                      GridItamWidget(
                        title: "Sunrise & Sunset",
                        middleWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                sunrizeWidget(Icons.arrow_upward_rounded),
                                const MaxGap(10),
                                Text(todayWeather.forecast!.forecastday![0]
                                        .astro!.sunrise
                                        .toString())
                                    .makeReqularText(context),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                sunrizeWidget(Icons.arrow_downward_rounded),
                                const MaxGap(10),
                                Text(todayWeather
                                        .forecast!.forecastday![0].astro!.sunset
                                        .toString())
                                    .makeReqularText(context),
                              ],
                            ),
                          ],
                        ),
                        subWidget: const SizedBox(),
                      ),
                      GridItamWidget(
                        title: "Humidity",
                        middleWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              todayWeather.current!.humidity!.toString(),
                            ).makeHeader1(context),
                            const MaxGap(5),
                            const Text("%").makeBoldHeader3(context),
                          ],
                        ),
                        subWidget: Center(
                          child: Text(WeatherHelper().categorizeHumidity(
                                  todayWeather.current!.humidity!))
                              .makeSubText(context),
                        ),
                      ),
                      GridItamWidget(
                        title: "Visibility",
                        middleWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              todayWeather.current!.visKm!.toString(),
                            ).makeHeader1(context),
                            const MaxGap(5),
                            const Text("%").makeBoldHeader3(context),
                          ],
                        ),
                        subWidget: Center(
                          child: Text(WeatherHelper().categorizeVisibility(
                                  todayWeather.current!.visKm!))
                              .makeSubText(context),
                        ),
                      ),
                      GridItamWidget(
                        title: "Air Quality",
                        middleWidget: Text(
                          todayWeather.current!.airQuality!.usEpaIndex!
                              .toString(),
                        ).makeHeader1(context),
                        subWidget: Center(
                          child: Text(WeatherHelper().categorizeAirWithEpaIndex(
                                  todayWeather
                                      .current!.airQuality!.usEpaIndex!))
                              .makeSubText(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sunrizeWidget(IconData iconData) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      radius: 15,
      child: Center(
        child: Icon(
          iconData,
        ),
      ),
    );
  }
}
