import 'package:blue_home/widgets/ChartData.dart';
import 'package:blue_home/widgets/chart_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  late Future<List<StatisticData>> statistics;

  @override
  void initState() {
    super.initState();
    statistics = fetchStatistics(); // Récupérer les données Firebase
  }

  Future<List<StatisticData>> fetchStatistics() async {
    try {
      final snapshot = await _database.child('sensorData').get(); // Chemin mis à jour

      print('Snapshot value: ${snapshot.value}');

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        // Mappez directement les champs nécessaires
        List<StatisticData> statistics = [
          StatisticData(label: 'Humidity', value: data['Humidity'].toString()),
          StatisticData(label: 'Temperature', value: data['Temperature'].toString()),
          StatisticData(label: 'Rain Detected', value: data['Rain_Detected'] == 1 ? 'Yes' : 'No'),
          StatisticData(label: 'Gas Detected', value: data['Gas_Detected'] == 1 ? 'Yes' : 'No'),
          StatisticData(label: 'Water Level', value: data['Water_Level'].toString()),
          StatisticData(label: 'Soil Moisture', value: data['Soil_Moisture'].toString()),
        ];

        return statistics;
      } else {
        throw Exception("No data found in sensorData");
      }
    } catch (e) {
      print('Error: $e'); // Debugging line
      throw Exception("Failed to fetch statistics: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<StatisticData>>(
          future: statistics,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No statistics available"));
            }

            List<StatisticData> data = snapshot.data!;

            String humidity = (data.firstWhere(
                  (item) => item.label == 'Humidity',
              orElse: () => StatisticData(label: 'Humidity', value: 'N/A'),
            )).value;

            String temperature = (data.firstWhere(
                  (item) => item.label == 'Temperature',
              orElse: () => StatisticData(label: 'Temperature', value: 'N/A'),
            )).value;

            String rainDetected = (data.firstWhere(
                  (item) => item.label == 'Rain Detected',
              orElse: () => StatisticData(label: 'Rain Detected', value: 'N/A'),
            )).value;

            String gasDetected = (data.firstWhere(
                  (item) => item.label == 'Gas Detected',
              orElse: () => StatisticData(label: 'Gas Detected', value: 'N/A'),
            )).value;

            String waterLevel = (data.firstWhere(
                  (item) => item.label == 'Water Level',
              orElse: () => StatisticData(label: 'Water Level', value: 'N/A'),
            )).value;

            String soilMoisture = (data.firstWhere(
                  (item) => item.label == 'Soil Moisture',
              orElse: () => StatisticData(label: 'Soil Moisture', value: 'N/A'),
            )).value;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 108.67,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatsBox('Humidity', humidity, Icons.cloud_outlined),
                        _buildStatsBox('Temperature', temperature, Icons.thermostat_outlined),
                        _buildStatsBox('Rain Detected', rainDetected, Icons.grain_outlined),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 108.67,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatsBox('Gas Detected', gasDetected, Icons.warning_amber_outlined),
                        _buildStatsBox('Water Level', waterLevel, Icons.water_outlined),
                        _buildStatsBox('Soil Moisture', soilMoisture, Icons.grass_outlined),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Affichage du graphique
                  Container(
                    width: double.infinity,
                    height: 297,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.02),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x423880F6),
                          blurRadius: 11.50,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ChartWidget(_createSampleData().cast<charts.Series<ChartData, String>>()), // Affichage du graphique
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Ajout de la barre de navigation
    );
  }

  // Méthode pour construire le BottomNavigationBar
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 68,
      decoration: ShapeDecoration(
        color: Color(0xFF2E79E6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C3880F6),
            blurRadius: 30.43,
            offset: Offset(0, 10.46),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.home, '/dashboard'),
          _buildNavIcon(Icons.bar_chart, '/statistics'),
          _buildNavIcon(Icons.notifications, '/history'),
          _buildNavIcon(Icons.settings, '/settings'),
        ],
      ),
    );
  }

  // Méthode pour chaque icône de navigation
  Widget _buildNavIcon(IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => Get.toNamed(route),
    );
  }

  // Méthode pour construire chaque boîte de statistiques
  Widget _buildStatsBox(String label, String value, IconData icon) {
    return Container(
      width: 99,
      height: 108.67,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F3981F6),
            blurRadius: 30.43,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25, color: Color(0xFF07123C)),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color(0xFF6F7EA8),
            ),
          ),
        ],
      ),
    );
  }

  List<charts.Series<ChartData, String>> _createSampleData() {
    final data = [
      ChartData('Mon', 1),
      ChartData('Tue', 2),
      ChartData('Wed', 3),
      ChartData('Thu', 4),
      ChartData('Fri', 5),
      ChartData('Sat', 6),
      ChartData('Sun', 7),
    ];

    return [
      charts.Series<ChartData, String>(
        id: 'Sales',
        domainFn: (ChartData sales, _) => sales.month,
        measureFn: (ChartData sales, _) => sales.value,
        data: data,
      ),
    ];
  }
}

class StatisticData {
  final String label;
  final String value;

  StatisticData({required this.label, required this.value});

  // Méthode pour convertir Realtime Database data en objet Dart
  factory StatisticData.fromDatabase(Map<dynamic, dynamic> databaseData) {
    return StatisticData(
      label: databaseData['label'] ?? '',
      value: databaseData['value'] ?? '',
    );
  }
}