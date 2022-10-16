import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_k/features/home_screen/view/home_screen.dart';

class OnBoardingController extends ChangeNotifier {
  void goToHomeScreen(BuildContext context, double lon, double lat) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomeScreen(
                    lat: lat,
                    lon: lon,
                  )));
}
