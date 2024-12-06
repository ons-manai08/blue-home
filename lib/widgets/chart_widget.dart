import 'package:blue_home/widgets/ChartData.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatelessWidget {
  final List<charts.Series<ChartData, String>> seriesList;
  final bool animate;

  const ChartWidget(this.seriesList, {Key? key, this.animate = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: charts.BarChart(
        seriesList,
        animate: animate,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}
