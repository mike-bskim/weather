import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getLocation() async{

    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint(position.toString());
    debugPrint(position.latitude.toString() + ' / ' + position.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('ElevatedButton clicked');
            getLocation();
          },
          child: const Text(
            'Get my location',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}