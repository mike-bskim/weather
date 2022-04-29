import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
// import 'package:weather/model/air_model.dart';
import 'package:weather/model/current_air.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/model/model.dart';

class WeatherScreen extends StatefulWidget {
  final CurrentWeather weatherData;
  final CurrentAir airData;

  const WeatherScreen(
      {Key? key, required this.weatherData, required this.airData})
      : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  late String currentDate;
  var date = DateTime.now();
  final Model _model = Model();
  late Widget airIcon;
  late Widget airState;
  double? pm2_5;
  double? pm10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.weatherData, widget.airData);
  }

  void updateData(CurrentWeather weatherData, CurrentAir airData) {
    var dt = weatherData.dt!;
    var timezone = weatherData.timezone!;
    var tempTime = DateTime.fromMillisecondsSinceEpoch((dt + timezone) * 1000);
    int index = airData.listed![0].main!.aqi!;
    pm10 = airData.listed![0].components!.pm10!;
    pm2_5 = airData.listed![0].components!.pm2_5!;

    airIcon = _model.getAirIcon(index);
    airState = _model.getAirCondition(index);

    cityName = weatherData.name!;
    temp = weatherData.main!.temp!.round();
    currentDate = DateFormat('yyyy-MM-dd, HH:mm:ss').format(tempTime);
    debugPrint('cityName[$cityName], temp[${weatherData.main!.temp}]');
    debugPrint('dt[$dt], timezone[$timezone], Date[$currentDate]');
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 150.0),
                            Text(
                              '${widget.weatherData.name}',
                              style: GoogleFonts.lato(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  const Duration(minutes: 1),
                                  builder: (context) {
                                    debugPrint(getSystemTime());
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ), //City Name, Date, Time
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.weatherData.main!.temp!.round().toString()}\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                // SvgPicture.asset('svg/climacon-sun.svg'),
                                _model.getWeatherIcon(
                                    widget.weatherData.weather![0].id!),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  '${widget.weatherData.weather![0].description}',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ), //Temperature
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ), //구분자
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              // Image.asset('image/bad.png',
                              //     width: 37.0, height: 35.0),
                              airIcon,
                              const SizedBox(height: 8),
                              airState,
                              // Text(
                              //   '"매우나쁨"',
                              //   style: GoogleFonts.lato(
                              //     fontSize: 14.0,
                              //     color: Colors.black87,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ), //AQI(대기질지수)
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$pm10',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'µg/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ), //미세먼지
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$pm2_5',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'µg/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ), //초미세먼지
                        ],
                      ),
                    ],
                  ), //extra information
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
