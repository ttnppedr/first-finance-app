import 'package:hive/hive.dart';

import 'model/add_date.dart';

int total = 0;

final box = Hive.box<AddData>('data');

int balance() {
  var history = box.values.toList();
  List items = [0];

  for (var i = 0; i < history.length; i++) {
    items.add(history[i].IN == 'Income'
        ? int.parse(history[i].amount)
        : int.parse(history[i].amount) * -1);
  }

  return items.reduce((value, element) => value + element);
}

int income() {
  var history = box.values.toList();
  List items = [0];

  for (var i = 0; i < history.length; i++) {
    items.add(history[i].IN == 'Income' ? int.parse(history[i].amount) : 0);
  }

  return items.reduce((value, element) => value + element);
}

int expenses() {
  var history = box.values.toList();
  List items = [0];

  for (var i = 0; i < history.length; i++) {
    items
        .add(history[i].IN == 'Income' ? 0 : int.parse(history[i].amount) * -1);
  }

  return items.reduce((value, element) => value + element);
}
