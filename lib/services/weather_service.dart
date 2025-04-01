import 'dart:convert';

import 'package:apicubit/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String baseUrl = 'https://api.weatherapi.com/v1/';
  String apiKey = 'd47576e79bf74ebeb38101727251303';
  WeatherModel? weather;
  Future<WeatherModel?> getWeather({required String CityName}) async {
    try {
      // int id = await getCityId(CityName: CityName);
      Uri uri =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=7');
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: 30));
      ;

      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
