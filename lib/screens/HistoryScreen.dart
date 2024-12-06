import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  // Exemple de données
  final List<Map<String, dynamic>> historyData = [
    {
      'dateTime': '2024-12-06 10:00',
      'flamme': 0.5,
      'gaz': 'Non Detected',
      'humidity': 60,
      'temperature': 22.5,
    },
    {
      'dateTime': '2024-12-06 11:00',
      'flamme': 0.6,
      'gaz': 'Detected',
      'humidity': 61,
      'temperature': 22.8,
    },
    {
      'dateTime': '2024-12-06 12:00',
      'flamme': 0.4,
      'gaz': 'Detected',
      'humidity': 59,
      'temperature': 22.3,
    },
    // Ajoutez d'autres données ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Historical Data',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('DateTime')),
                  DataColumn(label: Text('Flamme')),
                  DataColumn(label: Text('Gaz')),
                  DataColumn(label: Text('Humidity')),
                  DataColumn(label: Text('Temperature')),
                ],
                rows: historyData
                    .map(
                      (data) => DataRow(cells: [
                    DataCell(Text(data['dateTime'])),
                    DataCell(Text(data['flamme'].toString())),
                    DataCell(Text(data['gaz'].toString())),
                    DataCell(Text(data['humidity'].toString())),
                    DataCell(Text(data['temperature'].toString())),
                  ]),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
}
