import 'package:flutter/material.dart';
import 'package:weather_k/features/home_screen/view/home_screen.dart';
import 'package:weather_k/features/onboarding/view/onboarding_screen.dart';
import 'package:weather_k/features/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const WeatherK());
}

class WeatherK extends StatelessWidget {
  const WeatherK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
        SplashScreen.route: (_) => const SplashScreen(),
        OnBoardingScreen.route: (_) => const OnBoardingScreen(),
      },
    );
  }
}
