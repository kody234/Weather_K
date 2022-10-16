class ApiEndPoint {
  static String baseUrl({required double lat, required double lon}) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=e952c4e43b63467d60db1bde4b3c6785';
}
