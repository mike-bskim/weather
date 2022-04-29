import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String urlWeather;
  final String urlAir;

  Network(this.urlWeather, this.urlAir);

  Future<dynamic> getWeatherData() async {
    http.Response response = await http
        .get(Uri.parse(urlWeather));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http
        .get(Uri.parse(urlAir));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
