import 'option.dart';

class Quiz{
late final String text ;
late final List <Option> options;
late bool  isLocked ;
late Option? selectedOption;

Quiz({
  required this.text,
  required this.options,
  this.isLocked= false,
  this.selectedOption
});
}