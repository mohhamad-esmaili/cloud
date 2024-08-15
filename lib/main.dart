import 'package:cloud/Core/themes/app_themes.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:cloud/Features/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:cloud/Core/constants/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModelProvider()),
        ChangeNotifierProvider(create: (_) => HomeViewmodelProvider())
      ],
      child: const Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: RouterConstants.splashView,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
