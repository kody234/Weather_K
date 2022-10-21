import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_k/core/api/endpoint.dart';
import 'package:weather_k/core/api/weather_api.dart';
import 'package:weather_k/core/models/weather.dart';
import 'package:weather_k/core/utils/colors.dart';
import 'package:weather_k/core/utils/icons.dart';
import 'package:weather_k/core/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.lon, this.lat}) : super(key: key);

  static const String route = 'home_screen';

  final double? lon;
  final double? lat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFetching = false;
  double animatedFontSize = 15.sp;
  WeatherModel? _weatherModel;
  TextEditingController textController = TextEditingController();

  bool gotten = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationWeather();
  }

  getLocationWeather() async {
    _weatherModel = await WeatherApi().getWeather(
        ApiEndPoint.locationWeather(lat: widget.lat!, lon: widget.lon!));
    setState(() {
      gotten = true;
    });
  }

  getSearchedWeather() async {
    setState(() {
      isFetching = true;
    });
    _weatherModel = await WeatherApi()
        .getWeather(ApiEndPoint.searchedWeather(city: selectedValue!));
    setState(() {
      isFetching = false;
    });
    textController.clear();
  }

  String getWeatherRating(double temp) {
    if (temp < 15) {
      return 'Chilly';
    } else if (temp <= 35 && temp > 15) {
      return 'Good';
    } else if (temp <= 65 && temp > 35) {
      return 'Very Good';
    } else if (temp <= 100 && temp > 65) {
      return ' Boiling hot';
    }
    return '';
  }

  final List<String> items = [
    'Abuja',
    'Lagos',
    'Brussels',
    'Toronto',
    'kano',
    'Munich',
    'Milan',
    'Madrid',
    'Texas',
    'Cairo',
    'Dubai',
  ];

  String weatherIcon(int code) {
    if (code.toString().startsWith('2')) {
      return AppIcons.thunderstorm;
    } else if (code.toString().startsWith('3')) {
      return AppIcons.rainyDay;
    } else if (code.toString().startsWith('5')) {
      return AppIcons.rainyDay;
    } else if (code.toString().startsWith('6')) {
      return AppIcons.cloudyDay;
    } else if (code.toString().startsWith('7')) {
      return AppIcons.cloudyDay;
    } else if (code.toString().startsWith('800')) {
      return AppIcons.clearNight;
    } else if (code.toString().startsWith('8')) {
      return AppIcons.cloudyDay;
    }
    return '';
  }

  String weatherText(double temp) {
    if (temp < 15) {
      return 'It’s freezing out today.\nIt’s Arctic out there';
    } else if (temp <= 35 && temp > 15) {
      return 'It’s a bit chilly.\nWrap up warm in';
    } else if (temp <= 65 && temp > 35) {
      return 'It feels Like A good\ntime to ride a bike in';
    } else if (temp <= 100 && temp > 65) {
      return ' It’s absolutely boiling!,\nDid you order this sunshine?';
    }
    return '';
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    TextStyle myTextStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 29.sp,
        color: AppColors.splashPrimaryColor);
    return Scaffold(
      body: gotten == false
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.splashPrimaryColor,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
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
                              height: 40.h,
                              width: 40.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          AnimatedDefaultTextStyle(
                            style: TextStyle(
                                fontSize: animatedFontSize,
                                color: AppColors.splashPrimaryColor,
                                fontWeight: FontWeight.w400),
                            duration: const Duration(milliseconds: 400),
                            child: Text(
                              '${_weatherModel!.city?.name!}, ${_weatherModel!.city?.country!}',
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Text(
                                'Select',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });

                                getSearchedWeather();
                              },
                              buttonHeight: 40,
                              buttonWidth: 100,
                              itemHeight: 40,
                              dropdownMaxHeight: 500,
                              searchController: textController,
                              searchInnerWidget: Padding(
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 4.h,
                                  right: 8.w,
                                  left: 8.w,
                                ),
                                child: TextFormField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 8.h,
                                    ),
                                    hintText: 'Search for a country...',
                                    hintStyle: TextStyle(fontSize: 12.sp),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return (item.value
                                    .toString()
                                    .contains(searchValue));
                              },
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textController.clear();
                                }
                              },
                            ),
                          ),
                          isFetching
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(),
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${weatherText(_weatherModel!.list!.first.main!.temp!)} ${_weatherModel!.city?.name!}',
                            style: myTextStyle,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Image.asset(
                              AppIcons.icBicycle,
                              height: 26.h,
                              width: 26.w,
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
                                    children: [
                                      Text(
                                        'Today’s Like',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${_weatherModel!.list?.first.main?.temp!.toInt()}°',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 40.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50.h,
                              left: 40.w,
                              child: const WeatherTemplate(
                                url: AppIcons.cloudyDay,
                              ),
                            ),
                            Positioned(
                              top: 50.h,
                              right: 40.w,
                              child: const WeatherTemplate(
                                url: AppIcons.rainyDay,
                              ),
                            ),
                            Positioned(
                              top: 200.h,
                              left: 15.w,
                              child: const WeatherTemplate(
                                url: AppIcons.windyDay,
                              ),
                            ),
                            Positioned(
                              top: 200.h,
                              right: 10.w,
                              child: const WeatherTemplate(
                                url: AppIcons.clearNight,
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              left: 140.w,
                              child: const WeatherTemplate(
                                url: AppIcons.clearNight,
                              ),
                            ),
                            Positioned(
                              top: 180.h,
                              left: 180.w,
                              child: WeatherTemplate(
                                url: weatherIcon(_weatherModel!
                                    .list!.first.weather!.first.id!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Today’s Mood',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xff36424D)),
                              ),
                              Text(
                                getWeatherRating(
                                    _weatherModel!.list![1].main!.temp!),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
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
                            children: [
                              const Text(
                                'Tomorrow’s Mood',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xff36424D)),
                              ),
                              Text(
                                getWeatherRating(
                                    _weatherModel!.list![2].main!.temp!),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
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
