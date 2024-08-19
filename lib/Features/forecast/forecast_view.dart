import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Core/constants/app_layout.dart';
import 'package:cloud/Core/services/dateformater.dart';
import 'package:cloud/Core/widgets/divider_line_widget.dart';

class ForecastView extends StatelessWidget {
  final Forecastday todayWeather;
  const ForecastView({
    super.key,
    required this.todayWeather,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: AppLayout().weatherCardDecoration(context),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context)
                                .listTileTheme
                                .titleTextStyle!
                                .color,
                          ),
                        ),
                      ),
                      Text(DateFormaterService()
                              .getFullDate(todayWeather.date!))
                          .makeHeader2(context)
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: todayWeather.hour!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Hour todayHour = todayWeather.hour![index];

                      if (todayHour.condition!.code == null) {
                        return const Text("Data not Found");
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            todayHour.condition!.icon!,
                            color:
                                themeData.listTileTheme.titleTextStyle!.color,
                            height: 60,
                          ),
                          title: Text(
                            DateFormaterService().getDayHour(todayHour.time!),
                          ).makeBoldHeader3(context),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    makeSubtitle(
                                        todayHour.condition!.text!, context),
                                    const DividerlineWidget(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              makeSubtitle(
                                                  "UV: ${todayHour.uv!.toString()}",
                                                  context),
                                              makeSubtitle(
                                                  "Temp: ${todayHour.tempC!.toString()}°C",
                                                  context),
                                              makeSubtitle(
                                                  "Cloud: ${todayHour.cloud!.toString()}%",
                                                  context),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              makeSubtitle(
                                                  "Humidity: ${todayHour.humidity!.toString()}%",
                                                  context),
                                              makeSubtitle(
                                                  "Wind dir: ${todayHour.windir!.toString()}",
                                                  context),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text makeSubtitle(String subString, BuildContext context) =>
      Text(subString).makeSubText(context);
}
