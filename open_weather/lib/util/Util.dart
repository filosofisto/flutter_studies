import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Util {
  static String appId = "3ac4bf62c2bce1905cb443f672a689c4";

  static String formatDateTime(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, yyyy").format(dateTime);
  }

  static String formatDateTimeFromDt(int dt) {
    return formatDateTime(new DateTime.fromMillisecondsSinceEpoch(dt * 1000));
  }

  static String kelvinToCelsius(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(0) + "ºC";
  }

  static Widget getIcon({required String weatherMain, required Color color, required double size}) {
    switch(weatherMain) {
      case "Clear":
        return Icon(FontAwesomeIcons.sun, color: color, size: size,);
      case "Clouds":
        return Icon(FontAwesomeIcons.cloud, color: color, size: size,);
      case "Rain":
        return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);
      case "Snow":
        return Icon(FontAwesomeIcons.snowman, color: color, size: size,);
      default:
        return Icon(FontAwesomeIcons.sun, color: color, size: size,);
    }
  }
}