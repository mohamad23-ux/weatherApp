import 'package:apicubit/models/weather_model.dart';
import 'package:apicubit/pages/search_page.dart';
import 'package:apicubit/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    // String iconUrl = weatherData.weatherIcon;
    // String correctedUrl = iconUrl.replaceFirst('file://', 'https://');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 240, 239),
          title: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Today"),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchPage();
                    }));
                  },
                ),
              ],
            )
          ],
          // backgroundColor: Colors.white,
        ),
        body: weatherData == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "It's just a weather App,\n Let's search",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 0, 0),
                            fontSize: 34),
                      ),
                    ],
                  )
                ],
              )
            : Center(
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          weatherData!.getThemeColor(),
                          weatherData!.getThemeColor()[300]!,
                          weatherData!.getThemeColor()[100]!,
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: EdgeInsets.all(22),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)),
                            width: 190,
                            height: 190,
                            child: Image.network(
                              width: 220,
                              height: 220,
                              'https:${weatherData!.weatherIcon}',
                              fit: BoxFit.cover,
                            )),
                        Text(
                          '${Provider.of<WeatherProvider>(context).cityName ?? "Aleppo"}',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${(weatherData!.date.hour - 12).toString()}:${weatherData!.date.minute.toString()}',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Image.asset()
                            Text(
                              '30',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'max:${weatherData!.maxTemp}',
                                  style: TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  'min:${weatherData!.minTemp}',
                                  style: TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${weatherData!.weatherStateName}',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    )),
              ),
      ),
    );
  }
}
