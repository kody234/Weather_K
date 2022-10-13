import 'package:flutter/material.dart';
import 'package:weather_k/core/utils/colors.dart';
import 'package:weather_k/core/utils/icons.dart';
import 'package:weather_k/core/utils/images.dart';
import 'package:weather_k/features/onboarding/controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const route = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    OnBoardingController ctr = OnBoardingController();
    TextStyle myTextStyle = const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 42,
        color: AppColors.splashPrimaryColor);

    return Scaffold(
        backgroundColor: AppColors.onBoardingPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppImages.imClippedArt,
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lets See',
                          style: myTextStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              'The',
                              style: myTextStyle,
                            ),
                            Image.asset(
                              AppIcons.icStar,
                              height: 36,
                              width: 36,
                            )
                          ],
                        ),
                        Text(
                          'Weather\nAround You',
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 56,
                      width: 291,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.splashPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Text(
                          'Lets See',
                          style: myTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          ctr.goToHomeScreen(context);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
