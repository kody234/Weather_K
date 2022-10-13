import 'package:flutter/cupertino.dart';
import 'package:weather_k/features/home_screen/view/home_screen.dart';

class OnBoardingController {
  void goToHomeScreen(BuildContext context) =>
      Navigator.pushReplacementNamed(context, HomeScreen.route);
}
