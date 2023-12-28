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

List<AddData> today() {
  List<AddData> items = [];
  var history = box.values.toList();
  DateTime datetime = DateTime.now();

  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.day == datetime.day) {
      items.add(history[i]);
    }
  }

  return items;
}

List<AddData> week() {
  List<AddData> items = [];
  var history = box.values.toList();
  DateTime datetime = DateTime.now();

  for (var i = 0; i < history.length; i++) {
    if (datetime.day - 7 <= history[i].datetime.day &&
        history[i].datetime.day <= datetime.day) {
      items.add(history[i]);
    }
  }

  return items;
}

List<AddData> month() {
  List<AddData> items = [];
  var history = box.values.toList();
  DateTime datetime = DateTime.now();

  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.month == datetime.month) {
      items.add(history[i]);
    }
  }

  return items;
}

List<AddData> year() {
  List<AddData> items = [];
  var history = box.values.toList();
  DateTime datetime = DateTime.now();

  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.year == datetime.year) {
      items.add(history[i]);
    }
  }

  return items;
}

int sum_for_chart(List<AddData> history) {
  List items = [0];

  for (var i = 0; i < history.length; i++) {
    items.add(history[i].IN == 'Income'
        ? int.parse(history[i].amount)
        : int.parse(history[i].amount) * -1);
  }

  return items.reduce((value, element) => value + element);
}

List time(List<AddData> history, bool hour) {
  List<AddData> items = [];
  List total = [0, 0];
  int counter = 0;

  for (var i = 0; i < history.length; i++) {
    for (var j = i; j < history.length; j++) {
      if (hour && history[i].datetime.hour == history[j].datetime.hour) {
        items.add(history[j]);
        counter++;
      }

      if (!hour && history[i].datetime.day == history[j].datetime.day) {
        items.add(history[j]);
        counter++;
      }
    }
    total.add(sum_for_chart(items));
    items.clear();
    i = counter;
  }

  return total;
}
