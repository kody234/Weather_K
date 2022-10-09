import 'package:flutter/material.dart';
import 'package:weather_k/core/utils/colors.dart';
import 'package:weather_k/core/utils/icons.dart';
import 'package:weather_k/core/utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = 'splashScreen';

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
