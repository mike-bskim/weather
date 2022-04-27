import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('Screen B >> initState is called');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint('Screen B >> dispose is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Screen B >> build is called');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint('Screen B --> Screen A');
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
