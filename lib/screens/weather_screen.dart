import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic weatherData;

  const WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    temp = weatherData['main']['temp'].round();
    debugPrint('cityName[$cityName], temp[${weatherData['main']['temp'].toString()}]');
  }

  @override
  Widget build(BuildContext context) {

    var _utcTime = DateTime.now().toUtc();
    debugPrint(_utcTime.toString());

    // Get local time based on UTC time
    var _localTime = _utcTime.toLocal();
    debugPrint(_localTime.toString());
    debugPrint(DateTime.fromMillisecondsSinceEpoch((1651096900+7200) * 1000).toString());
    debugPrint(DateTime.fromMillisecondsSinceEpoch((1651033070+7200) * 1000).toString());
    debugPrint(DateTime.fromMillisecondsSinceEpoch(1651096900 * 1000).toString());


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cityName, style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 40),
              Text(temp.toString(), style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
