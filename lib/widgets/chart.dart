import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/model/add_date.dart';
import '../data/utility.dart';

class Chart extends StatefulWidget {
  int indexX;
  Chart({Key? key, required this.indexX}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? items;
  bool b = true;
  bool j = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.indexX) {
      case 0:
        items = today();
        break;
      case 1:
        items = week();
        b = false;
        break;
      case 2:
        items = month();
        b = false;
        break;
      case 3:
        items = year();
        j = false;
        break;
    }
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              ...List.generate(time(items!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? items![index].datetime.hour.toString()
                            : items![index].datetime.day.toString()
                        : items![index].datetime.month.toString(),
                    b
                        ? index > 0
                            ? time(items!, true)[index] +
                                time(items!, true)[index - 1]
                            : time(items!, true)[index]
                        : index > 0
                            ? time(items!, false)[index] +
                                time(items!, false)[index - 1]
                            : time(items!, false)[index]);
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
