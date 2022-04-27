import 'package:flutter/material.dart';

import 'screens/loading.dart';
import 'screens/screen_a.dart';
import 'screens/screen_b.dart';
import 'screens/screen_c.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Loading(),
      // initialRoute: '/', // pushNamed
      // routes: {          // pushNamed
      //   '/' : (context) => const ScreenA(),
      //   '/b' : (context) => const ScreenB(),
      //   '/c' : (context) => const ScreenC(),
      // },
    );
  }
}