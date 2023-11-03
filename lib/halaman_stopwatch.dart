import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool isRunning = false;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  late final Stopwatch _stopwatch;
  List<String> laps = [];

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(),
              style: TextStyle(fontSize: 48, color: Colors.black),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isRunning) {
                        _stopwatch.stop();
                      } else {
                        _stopwatch.start();
                        startTimer();
                      }
                      isRunning = !isRunning;
                    });
                  },
                  child: Text(isRunning ? 'Pause' : 'Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isRunning) {
                        _stopwatch.stop();
                        isRunning = false;
                      }
                      _stopwatch.reset();
                      hours = 0;
                      minutes = 0;
                      seconds = 0;
                      milliseconds = 0;
                      laps.clear();
                    });
                  },
                  child: Text('Reset'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isRunning) {
                        laps.add(formatTime());
                      }
                    });
                  },
                  child: Text('Lap'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (laps.isNotEmpty)
              Column(
                children: laps
                    .map((lap) => Text(
                          lap,
                          style: TextStyle(fontSize: 24),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const milliSec = Duration(milliseconds: 1);
    const autoResetDuration = Duration(minutes: 1);
    Timer.periodic(milliSec, (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      } else {
        setState(() {
          milliseconds = _stopwatch.elapsedMilliseconds;
          seconds = (milliseconds / 1000).floor();
          minutes = (seconds / 60).floor();
          hours = (minutes / 60).floor();
          milliseconds %= 1000;
          seconds %= 60;
          minutes %= 60;
        });

        if (_stopwatch.elapsed > autoResetDuration) {
          setState(() {
            _stopwatch.reset();
            hours = 0;
            minutes = 0;
            seconds = 0;
            milliseconds = 0;
            laps.clear();
          });
        }
      }
    });
  }

  String formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMilliseconds = twoDigits(milliseconds ~/ 10);
    String twoDigitSeconds = twoDigits(seconds);
    String twoDigitMinutes = twoDigits(minutes);
    String twoDigitHours = twoDigits(hours);
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilliseconds";
  }
}
