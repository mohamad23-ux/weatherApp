// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String weatherIcon;
  //you should desgin your model like your Ui or your needs
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.weatherIcon
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // date = ;
    // temp = ;
    // maxTemp = jsonData['maxtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // weatherStateName = ;

    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherIcon: data['forecast']['forecastday'][3]['hour'][13]['condition']['icon'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
        
  }
MaterialColor getThemeColor(){
  if(weatherStateName=='Clear'||weatherStateName=='Light Clouds'||weatherStateName=='Sunny'){
    return Colors.orange;
  }
  else if(weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
return Colors.blueGrey;
  }
  else if(weatherStateName=='Heavy Rain'||weatherStateName=='Showers'){
    return Colors.blue;
  }else{
    return Colors.green;
  }
}
  @override
  String toString() {
    return 'temp = $temp  minTemp= $minTemp date=$date icon=$weatherIcon ';
  }

}








