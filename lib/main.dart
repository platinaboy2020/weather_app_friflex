import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/utils/locator.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/theme/theme.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';
import 'package:weather_app_friflex/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  WeatherPreferences.initPreferences();
  runApp(WeatherApp(router: AppRouter()));
}

class WeatherApp extends StatelessWidget {
  final AppRouter router;
  const WeatherApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: Themes.lightTheme,
      onGenerateRoute: router.generateRoute,
      initialRoute: WeatherPreferences.getCity() != null ? HOME : SELECT_CITY,
    );
  }
}
