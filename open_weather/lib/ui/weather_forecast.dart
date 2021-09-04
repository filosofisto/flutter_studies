import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_weather/model/weather_forecast_model.dart';
import 'package:open_weather/service/network.dart';
import 'package:open_weather/ui/bottom_view.dart';
import 'package:open_weather/ui/mid_view.dart';

class WeatherForecastUI extends StatefulWidget {
  const WeatherForecastUI({Key? key}) : super(key: key);

  @override
  _WeatherForecastUIState createState() => _WeatherForecastUIState();
}

class _WeatherForecastUIState extends State<WeatherForecastUI> {

  late Future<WeatherForecastModel> forecast;
  String _cityName = "cracow";

  @override
  void initState() {
    super.initState();
    refreshWeatherForecast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecast,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      BottomView(snapshot: snapshot)
                    ],
                  );
                } else {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  // }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter city name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              refreshWeatherForecast(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> refreshWeatherForecast({required String cityName}) =>
      forecast = new Network().getWeatherForecast(cityName: cityName);
}

