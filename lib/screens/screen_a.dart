import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint('Screen A >> Go to the Screen B');
                Navigator.pushNamed(context, '/b');
              },
              child: const Text('Go to the Screen B'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Screen A >> Go to the Screen C');
                Navigator.pushNamed(context, '/c');
              },
              child: const Text('Go to the Screen C'),
            ),
          ],
        ),
      ),
    );
  }
}
