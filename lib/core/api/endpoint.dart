class ApiEndPoint {
  static String locationWeather({required double lat, required double lon}) =>
      'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=e952c4e43b63467d60db1bde4b3c6785&units=metric';

  static String searchedWeather({
    required String city,
  }) =>
      'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=e952c4e43b63467d60db1bde4b3c6785&units=metric';
}
