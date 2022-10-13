import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_k/core/utils/colors.dart';
import 'package:weather_k/core/utils/icons.dart';
import 'package:weather_k/core/utils/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home_screen';

  @override
  Widget build(BuildContext context) {
    TextStyle myTextStyle = const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 27,
        color: AppColors.splashPrimaryColor);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 27, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppImages.imAvatar,
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  const Text(
                    'New York-USA ',
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.splashPrimaryColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Feels Like A good\ntime to ride a bike',
                    style: myTextStyle,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Image.asset(
                      AppIcons.icBicycle,
                      height: 26,
                      width: 26,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      padding: const EdgeInsets.all(30),
                      color: Colors.transparent,
                    ),
                    Positioned(
                      top: 30,
                      left: 35,
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: const BoxDecoration(
                            color: AppColors.splashPrimaryColor,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Today’s Like',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '25°',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 40,
                      child: WeatherTemplate(
                        url: AppIcons.cloudyDay,
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      right: 40,
                      child: WeatherTemplate(
                        url: AppIcons.rainyDay,
                      ),
                    ),
                    const Positioned(
                      top: 200,
                      left: 25,
                      child: WeatherTemplate(
                        url: AppIcons.windyDay,
                      ),
                    ),
                    const Positioned(
                      top: 200,
                      right: 25,
                      child: WeatherTemplate(
                        url: AppIcons.clearNight,
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 150,
                      child: WeatherTemplate(
                        url: AppIcons.clearNight,
                      ),
                    ),
                    const Positioned(
                      top: 170,
                      left: 190,
                      child: WeatherTemplate(
                        url: AppIcons.rainyDay,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Today’s Mood',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff36424D)),
                      ),
                      Text(
                        'Very Good',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff0C1823)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tomorrow’s Mood',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff36424D)),
                      ),
                      Text(
                        'Excellent ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff0C1823)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherTemplate extends StatelessWidget {
  const WeatherTemplate({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      height: 55,
      width: 55,
      fit: BoxFit.cover,
    );
  }
}
