import 'package:apicubit/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  String? weatherIcon;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
  

  WeatherModel? get weatherData => _weatherData;
}
