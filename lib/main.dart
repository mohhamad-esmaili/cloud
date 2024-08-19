import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cloud/Core/themes/app_themes.dart';
import 'package:cloud/Core/constants/app_routes.dart';
import 'package:cloud/Features/setting_provider.dart';
import 'package:cloud/Features/home/home_viewmodel.dart';
import 'package:cloud/Features/splash/splash_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingProvider()),
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
    return Consumer<SettingProvider>(
      builder: (context, settingProvider, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: settingProvider.themeMode,
        initialRoute: RouterConstants.splashView,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
