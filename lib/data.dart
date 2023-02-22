import 'package:quiz_app/quiz.dart';

import 'option.dart';

final quizzes = [
  Quiz(
    text: "10 + 10",
    options: [
      Option(text: "20", isCorrect: true),
      Option(text: "50", isCorrect: false),
      Option(text: "60", isCorrect: false),
      Option(text: "200", isCorrect: false),
    ],
  ),
  Quiz(
    text: "10 + 40",
    options: [
      Option(text: "20", isCorrect: false),
      Option(text: "50", isCorrect: true),
      Option(text: "60", isCorrect: false),
      Option(text: "200", isCorrect: false),
    ],
  ),
  Quiz(
    text: "100 + 100",
    options: [
      Option(text: "20", isCorrect: false),
      Option(text: "50", isCorrect: false),
      Option(text: "60", isCorrect: false),
      Option(text: "200", isCorrect: true),
    ],
  ),
  Quiz(
    text: "40 + 20",
    options: [
      Option(text: "20", isCorrect: false),
      Option(text: "50", isCorrect: false),
      Option(text: "60", isCorrect: true),
      Option(text: "200", isCorrect: false),
    ],
  ),
];
