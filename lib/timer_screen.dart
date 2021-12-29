import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/timer_bloc.dart';

class TimerScreen extends StatelessWidget {
  final Duration duration;

  const TimerScreen({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TimerBloc>(
      create: (context) => TimerBloc(duration)..startTimer(context),
      dispose: (context, bloc) => bloc.dispose(),
      builder: (context, _) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 35,
                right: 20,
                child: GestureDetector(
                  child: Row(
                    children: const [
                      Text(
                        'Skip rest',
                        style: TextStyle(
                            color: Color(0xFF93A32D),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF93A32D),
                      )
                    ],
                  ),
                  onTap: () =>
                      context.read<TimerBloc>().cancelTimerAndPop(context),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rest Time',
                    ),
                    StreamBuilder<Duration>(
                      stream: context.read<TimerBloc>().timerStream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData
                              ? '${snapshot.data!.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                                  '${(snapshot.data!.inSeconds.remainder(60).toString().padLeft(2, '0'))}'
                              : '00:00',
                          style: const TextStyle(fontSize: 40),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
