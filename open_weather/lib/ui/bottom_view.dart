import 'package:flutter/material.dart';
import 'package:open_weather/model/weather_forecast_model.dart';
import 'package:open_weather/util/Util.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = []; // have to can another API
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Day Weather Forecast".toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    child: forecastData(snapshot, index),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff9661C3), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
            itemCount: 1),
      )
    ],
  );
}

Widget forecastData(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var dayOfWeek = Util.formatDateTimeFromDt(snapshot.data!.dt).split(",")[0];
  return new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(dayOfWeek)
    ],
  );
}
