import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
              initialRoute: SplashScreen.route,
              debugShowCheckedModeBanner: false,
              routes: {
                HomeScreen.route: (_) => const HomeScreen(),
                SplashScreen.route: (_) => const SplashScreen(),
                OnBoardingScreen.route: (_) => const OnBoardingScreen(),
              },
            ));
  }
}
