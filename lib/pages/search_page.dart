import 'package:apicubit/models/weather_model.dart';
import 'package:apicubit/providers/weather_provider.dart';
import 'package:apicubit/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: SearchBar(
                    onSubmitted: (data) async {
                      cityName = data;

                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(CityName: cityName!);

                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;
                      print(weather);
                      Navigator.pop(context);
                    },
                    hintText: "Search a city",
                    onChanged: (data) {
                      cityName = data;
                    },
                    leading: IconButton(
                        onPressed: () async {
                          WeatherService service = WeatherService();
                          WeatherModel? weather =
                              await service.getWeather(CityName: cityName!);

                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = weather;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .cityName = cityName;
                          print(weather);
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.search)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
