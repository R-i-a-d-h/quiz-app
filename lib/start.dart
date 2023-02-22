import 'package:flutter/material.dart';
import 'package:quiz_app/quiz-widget.dart';
class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor :Colors.grey.shade200,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const QuizWidget()));

            },

              child: Text(
                " S T A R T ",
                style: TextStyle(fontSize: 28),
          ),),
        ),
      ),
    );
  }
}
