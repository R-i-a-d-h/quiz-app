import 'package:flutter/material.dart';
import 'package:quiz_app/option.dart';
import 'package:quiz_app/quiz.dart';
class OptionsWidget extends StatelessWidget {
  final Quiz quiz;
  final ValueChanged<Option> onClickedOption;
  const OptionsWidget({Key? key, required this.quiz, required this.onClickedOption}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: quiz.options.map((option) => buildOption(context,option)).toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option,quiz);
    return GestureDetector(
      onTap: ()=>onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text,style: const TextStyle(fontSize: 20),),
            getIconForOption(option , quiz),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Quiz quiz) {
    final isSelected =option == quiz.selectedOption;
    if(quiz.isLocked){
      if(isSelected){
        return option.isCorrect ? Colors.grey : Colors.red;
      }else if (option.isCorrect){
      return Colors.green;
      }

    }

    return Colors.grey.shade200;

  }

 Widget getIconForOption(Option option, Quiz quiz) {
   final isSelected =option == quiz.selectedOption;
   if(quiz.isLocked){
     if(isSelected){
       return option.isCorrect ? const Icon(Icons.check_circle ,color: Colors.green,): const Icon(Icons.cancel,color: Colors.red,);
     }else if (option.isCorrect){
       return const Icon(Icons.check_circle ,color: Colors.green,);
     }

   }

   return const SizedBox.shrink();

 }


}
