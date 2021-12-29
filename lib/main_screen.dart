import 'package:flutter/material.dart';
import 'package:timer/timer_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TimerScreen(
                duration: Duration(seconds: 30),
              ),
            ),
          ),
          child: const Text(
            'Start timer',
          ),
          style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
        ),
      ),
    );
  }
}
