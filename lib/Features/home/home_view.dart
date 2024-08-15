import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud/Core/data/weather_model.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TodayWeatherModel todayWeather =
        Provider.of<HomeViewmodelProvider>(context).getTodayWeather;
    print(todayWeather.current!.condition?.text);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              scale: 0.2,
              imageUrl: ("https:${todayWeather.current!.condition!.icon!}"),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
