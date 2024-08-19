import 'package:cloud/Core/constants/app_colors.dart';
import 'package:cloud/Core/constants/app_routes.dart';
import 'package:cloud/Core/constants/enums.dart';

import 'package:cloud/Core/themes/app_fonts.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:cloud/Features/setting_provider.dart';
import 'package:cloud/Features/splash/splash_viewmodel.dart';
import 'package:cloud/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModelProvider splashProvider =
        Provider.of<SplashViewModelProvider>(context, listen: true);
    splashProvider.refreshApiData(
        Provider.of<SettingProvider>(context, listen: true).userLocation);
    ApiEnum apiEnum = splashProvider.getIsApiLoaded;
    if (apiEnum.name.toString() == ApiEnum.done.name.toString()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<HomeViewmodelProvider>(context, listen: false)
            .updateTodayModel(splashProvider.getTodayWeatherUpdated);

        Navigator.of(context).pushNamedAndRemoveUntil(
            RouterConstants.homeView, (Route<dynamic> route) => false);
      });
    }
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.wiCloud,
                color: Colors.white,
                height: 150,
              ),
              const Text("Cloud").makeBoldHeader1(context),
              const MaxGap(50),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              Consumer<SplashViewModelProvider>(
                builder: (context, splashp, child) => splashp.hasError == true
                    ? Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height / 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Something went Wrong :(")
                                .makeReqularText(context),
                            const Text("---- Use Vpn ----")
                                .makeReqularText(context),
                            const Gap(10),
                            TextButton(
                              onPressed: () => splashProvider.refreshApiData(
                                  Provider.of<SettingProvider>(context)
                                      .userLocation),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.amber)),
                              child: const Text("Try Again")
                                  .makeBoldHeader3(context),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
