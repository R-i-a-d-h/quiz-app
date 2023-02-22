import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start.dart';

import 'data.dart';

class Result extends StatelessWidget {
  late int score ;
  late Duration duration ;
  Result({Key? key ,required this.duration,required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: score == quizzes.length
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(
                    " congratulation ".toUpperCase(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SCORE :$score / ${quizzes.length}'),
                      Text('TIME :${_printDuration(duration)}'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        minimumSize: const Size(double.infinity, 48)),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text(
                      " C L O S E ",
                      style: TextStyle(fontSize: 28),
                    ),
                  )
                ])
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SCORE :$score / ${quizzes.length}'),
                        Text('TIME :${_printDuration(duration)}'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          minimumSize: const Size(double.infinity, 48)),
                      onPressed: () {
                        for(Quiz q in quizzes){
                          q.isLocked= false;
                          q.selectedOption = null;

                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartPage()));
                      },
                      child: const Text(
                        " T R Y  A G A I N ",
                        style: TextStyle(fontSize: 28),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
