import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_k/features/home_screen/view/home_screen.dart';
import 'package:weather_k/features/onboarding/view/onboarding_screen.dart';

class SplashScreenController {
  void goToOnBoarding(BuildContext context, Position position) =>
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => OnBoardingScreen(
                    position: position,
                  )));
}
