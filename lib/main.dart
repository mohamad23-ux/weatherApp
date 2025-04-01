import 'package:apicubit/models/weather_model.dart';
import 'package:apicubit/pages/home.dart';
import 'package:apicubit/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) {
          return WeatherProvider();
        },
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context)
              .weatherData==null?Colors.deepPurple:
              Provider.of<WeatherProvider>(context)
              .weatherData!.getThemeColor()),
      home: Home(), // الصفحة الرئيسية
    );
  }
}
