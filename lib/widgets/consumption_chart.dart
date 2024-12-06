import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ConsumptionChart extends StatelessWidget {
  final List<charts.Series<num, num>> seriesList;  // Définition des types comme num
  final bool animate;

  const ConsumptionChart(this.seriesList, {Key? key, this.animate = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: charts.LineChart(
        seriesList,
        animate: animate,
        behaviors: [
          charts.SeriesLegend(),
        ],
      ),
    );
  }
}
