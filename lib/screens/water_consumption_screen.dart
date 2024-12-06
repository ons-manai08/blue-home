import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Remplacez par fl_chart
import '../widgets/custom_button.dart';

class WaterConsumptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion de la Consommation d\'Eau')),
      body: Column(
        children: [
          _buildConsumptionChart(),
          _buildAlertSettings(),
        ],
      ),
    );
  }

  Widget _buildConsumptionChart() {
    // Exemple de données réelles
    final data = [
      _ChartData(1, 50),
      _ChartData(2, 75),
      _ChartData(3, 100),
      _ChartData(4, 125),
    ];

    return Container(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 150,
          lineBarsData: [
            LineChartBarData(
              spots: data.map((e) => FlSpot(e.x.toDouble(), e.y.toDouble())).toList(),
              isCurved: true,
              colors: [Colors.blue],
              barWidth: 4,
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertSettings() {
    return CustomButton(
      label: 'Configurer les alertes',
      onPressed: () {
        // Logique pour configurer les alertes
      },
    );
  }
}

class _ChartData {
  final num x;
  final num y;

  _ChartData(this.x, this.y);
}
