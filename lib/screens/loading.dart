import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
// import 'package:weather/model/air_model.dart';
import 'package:weather/model/current_air.dart';
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
    debugPrint('loading.dart >> ' +
        latitude.toString() +
        ' / ' +
        longitude.toString());
    // https://api.openweathermap.org/data/2.5/weather?lat=45.4642033&lon=9.1899817&appid=1e1a2b8f6d9b5311cd82d001e7b20131
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    // https://api.openweathermap.org/data/2.5/forecast/hourly?lat={lat}&lon={lon}&appid={API key}
    // https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
// https://api.openweathermap.org/data/2.5/onecall?lat=45.4642033&lon=9.1899817&appid=1e1a2b8f6d9b5311cd82d001e7b20131&units=metric&lang=kr&exclude=minutely

    String _baseApiWeather = 'https://api.openweathermap.org/data/2.5/weather';
    String _baseApiAir =
        'https://api.openweathermap.org/data/2.5/air_pollution';
    String _option = 'units=metric&lang=kr';
    String _lat = 'lat=${latitude.toString()}';
    String _lon = 'lon=${longitude.toString()}';
    Network network = Network(
        '$_baseApiWeather?$_lat&$_lon&appid=$apiKey&$_option',
        '$_baseApiAir?$_lat&$_lon&appid=$apiKey&$_option');
    var weatherData = await network.getWeatherData();
    debugPrint(weatherData.toString());
    CurrentWeather currentWeatherData = CurrentWeather.fromJson(weatherData);
    debugPrint(currentWeatherData.name);

    var airData = await network.getAirData();
    debugPrint(airData.toString());
    CurrentAir currentAirData = CurrentAir.fromJson(airData);
    debugPrint(currentAirData.listed![0].main!.aqi!.toString());

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherScreen(
                  weatherData: currentWeatherData,
                  airData: currentAirData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
