import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather/model/weather_forecast_model.dart';
import 'package:open_weather/util/Util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.weather;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${snapshot.data!.name}, ${snapshot.data!.sys.country}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87),
          ),
          Text(
            "${Util.formatDateTimeFromDt(snapshot.data!.dt)}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Util.getIcon(weatherMain: snapshot.data!.weather[0].main, color: Colors.pinkAccent, size: 198),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "${Util.kelvinToCelsius(snapshot.data!.main.temp)}",
                  style: TextStyle(fontSize: 34),
                ),
                Text("${snapshot.data!.weather[0].description.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${snapshot.data!.wind.speed} mi/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${snapshot.data!.main.humidity} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${Util.kelvinToCelsius(snapshot.data!.main.tempMax)}"),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );

  return midView;
}
