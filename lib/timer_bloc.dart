import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TimerBloc {
  final _timerController = BehaviorSubject<Duration>();

  Stream<Duration> get timerStream => _timerController.stream;

  Duration _duration;
  Timer? _timer;

  TimerBloc(this._duration);

  void startTimer(BuildContext context) {
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => _decreaseTime(context));
  }

  void cancelTimerAndPop(BuildContext context) {
    _timer?.cancel();
    Navigator.of(context).pop();
  }

  void _decreaseTime(BuildContext context) {
    final secondsLeft = _duration.inSeconds - 1;
    _duration = Duration(seconds: secondsLeft);
    _timerController.add(_duration);
    if (_duration.inSeconds == 0) {
      cancelTimerAndPop(context);
    }
  }

  void dispose() {
    _timerController.close();
    _timer?.cancel();
  }
}
