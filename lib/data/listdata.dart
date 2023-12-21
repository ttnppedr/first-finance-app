import 'money.dart';

List<Money> getter() {
  Money education = Money();
  education.name = 'edu';
  education.fee = '650';
  education.time = 'today';
  education.image = 'Education.png';
  education.buy = false;

  Money food = Money();
  food.name = 'food';
  food.fee = '15';
  food.time = 'today';
  food.image = 'Food.png';
  food.buy = true;

  Money transfer = Money();
  transfer.name = 'transfer';
  transfer.fee = '100';
  transfer.time = 'jan 20, 2022';
  transfer.image = 'Transfer.png';
  transfer.buy = true;

  return [education, food, transfer, education, food, transfer];
}
