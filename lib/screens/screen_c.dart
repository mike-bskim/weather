import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint('Screen C --> Screen A');
                  Navigator.pop(context);
                  // Navigator.pushNamed(context, '/');
                },
                child: const Text('Go to the Screen A'),
              ),
            ],
          )),
    );
  }
}
