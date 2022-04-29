import 'package:flutter/material.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/screens/weather_screen.dart';

const apiKey = '1e1a2b8f6d9b5311cd82d001e7b20131';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    // fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();

    await myLocation.getMyCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    debugPrint('loading.dart >> ' + latitude.toString() +' / ' +longitude.toString());
    // https://api.openweathermap.org/data/2.5/weather?lat=45.4642033&lon=9.1899817&appid=1e1a2b8f6d9b5311cd82d001e7b20131
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    // https://api.openweathermap.org/data/2.5/forecast/hourly?lat={lat}&lon={lon}&appid={API key}
    // https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
// https://api.openweathermap.org/data/2.5/onecall?lat=45.4642033&lon=9.1899817&appid=1e1a2b8f6d9b5311cd82d001e7b20131&units=metric&lang=kr&exclude=minutely

    String baseApi = 'https://api.openweathermap.org/data/2.5/weather';
    Network network = Network(
        '$baseApi?lat=${latitude.toString()}&lon=${longitude.toString()}&appid=$apiKey&units=metric&lang=kr');
    var weatherData = await network.getJsonData();
    debugPrint(weatherData.toString());

    CurrentWeather currentWeather = CurrentWeather.fromJson(weatherData);
    debugPrint(currentWeather.name);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(weatherData: currentWeather)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('ElevatedButton clicked~~');
          },
          child: const Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
