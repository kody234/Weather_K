import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:weather_k/core/models/weather.dart';

class WeatherApi {
  Future<WeatherModel?> getWeather(String endPoint) async {
    try {
      var res = await Dio().get(endPoint);
      if (res.statusCode == 200) {
        debugPrint('success');
        debugPrint(res.data.toString(), wrapWidth: 1024);
        return weatherModelFromJson(res.data);
      } else {
        debugPrint('failure');
      }
    } on DioError catch (e) {
      debugPrint(e.message.toString());
    }

    return null;
  }
}
