import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_k/core/service/location/controller.dart';
import 'package:weather_k/core/utils/colors.dart';
import 'package:weather_k/core/utils/icons.dart';
import 'package:weather_k/core/utils/images.dart';
import 'package:weather_k/features/onboarding/view/onboarding_screen.dart';
import 'package:weather_k/features/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController ctr = SplashScreenController();
  Position? position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosition();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (position != null) {
        timer.cancel();
        ctr.goToOnBoarding(context, position!);
      }
    });
  }

  getPosition() async {
    position = await Location.determinePosition();

    debugPrint(position?.latitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashPrimaryColor,
      body: Center(
        child: Image.asset(
          AppImages.imSplashScreen,
          height: 136,
          width: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
