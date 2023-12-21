import 'money.dart';

List<money> getter() {
  money education = money();
  education.name = 'edu';
  education.fee = '650';
  education.time = 'today';
  education.image = 'Education.png';
  education.buy = false;

  money food = money();
  food.name = 'food';
  food.fee = '15';
  food.time = 'today';
  food.image = 'Food.png';
  food.buy = true;

  money transfer = money();
  transfer.name = 'transfer';
  transfer.fee = '100';
  transfer.time = 'jan 20, 2022';
  transfer.image = 'Transfer.png';
  transfer.buy = true;

  return [education, food, transfer, education, food, transfer];
}
