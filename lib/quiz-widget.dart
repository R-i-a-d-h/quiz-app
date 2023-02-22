import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/option.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

import 'options-widget.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({Key? key}) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late PageController controller;
  int quizzesNumber = 1;
  int score = 0;
   bool isLocked = false;
   String t = "00:00:00";
   late Stopwatch stopwatch ;

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState(){
    super.initState();
    controller = PageController(initialPage: 0);
    stopwatch = Stopwatch();
    stopwatch.start();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('QUIZ :$quizzesNumber / ${quizzes.length}'),
                
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Text('TIME : ${_printDuration(stopwatch.elapsed)}');
                  },
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final quiz = quizzes[quizzesNumber-1];
                  return buildQuiz(quiz);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQuiz(Quiz quiz) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          quiz.text,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(child: OptionsWidget(quiz: quiz,
          onClickedOption: (option){
          if(quiz.isLocked){
            return;
          }else{
            setState(() {
              quiz.isLocked = true;
              quiz.selectedOption =option;
            });
            isLocked = quiz.isLocked;
            if(quiz.selectedOption!.isCorrect){
              score++;
            }

          }

          },

        ),
        ),
         isLocked ?  buildElevatedButton() : const SizedBox.shrink(),
      ],
    );
  }
   Widget buildElevatedButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(
              backgroundColor :Colors.grey.shade200,
               minimumSize: const Size(double.infinity, 48),
              ) ,
          onPressed: (){
        if(quizzesNumber < quizzes.length){
          controller.nextPage(
            duration : const Duration(milliseconds: 250),
            curve : Curves.easeInExpo,
          );
          setState(() {
            quizzesNumber++;
            isLocked = false;
          });

        }else{
          Duration duration =stopwatch.elapsed;
          stopwatch.stop();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Result(score: score,duration: duration,)));

        }
      }, child: Text(quizzesNumber < quizzes.length ? "Next Page " : 'See The Result')
      ),
    );
 }


}


