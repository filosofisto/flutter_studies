import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_weather/model/weather_forecast_model.dart';
import 'package:open_weather/util/Util.dart';

class Network {

  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    var url = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${Util.appId}";

    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }

    throw Exception("Error getting weather forecast");
  }
}