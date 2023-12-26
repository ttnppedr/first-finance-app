import 'money.dart';

List<Money> getter_top() {
  Money education = Money();
  education.name = 'edu';
  education.fee = '- \$ 650';
  education.time = 'jan 20, 2022';
  education.image = 'Education.png';
  education.buy = true;

  Money food = Money();
  food.name = 'food';
  food.fee = '- \$ 60';
  food.time = 'today';
  food.image = 'Food.png';
  food.buy = true;

  return [education, food];
}
