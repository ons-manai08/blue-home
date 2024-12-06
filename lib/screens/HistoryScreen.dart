import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref('historique');
  List<Map<String, dynamic>> historyData = [];

  @override
  void initState() {
    super.initState();
    // Récupérer les données de Firebase lors du chargement de la page
    _fetchHistoryData();
  }

  // Méthode pour récupérer les données d'historique depuis Firebase
  void _fetchHistoryData() async {
    final snapshot = await _databaseRef.get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      List<Map<String, dynamic>> loadedHistory = [];

      data.forEach((key, value) {
        // Déboguer la structure des données récupérées
        print('Clé: $key, Valeur: $value');

        loadedHistory.add({
          'dateTime': value['datetime'] ?? 'N/A', // Vérification si null
          'flamme': value['Flame_Detected']?.toString() ?? '0', // Conversion en String
          'gaz': value['Gas_Detected']?.toString() ?? '0', // Conversion en String
          'humidity': value['Humidity']?.toString() ?? '0', // Conversion en String
          'temperature': value['Temperature']?.toString() ?? '0', // Conversion en String
        });
      });

      setState(() {
        historyData = loadedHistory;
      });
    } else {
      print('Aucune donnée trouvée dans Firebase');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Date/Heure')),
                    DataColumn(label: Text('Flamme')),
                    DataColumn(label: Text('Gaz')),
                    DataColumn(label: Text('Humidité')),
                    DataColumn(label: Text('Température')),
                  ],
                  rows: historyData
                      .map(
                        (data) => DataRow(cells: [
                      DataCell(Text(data['dateTime'])),
                      DataCell(Text(data['flamme'])), // Affichage en String
                      DataCell(Text(data['gaz'])), // Affichage en String
                      DataCell(Text(data['humidity'])), // Affichage en String
                      DataCell(Text(data['temperature'])), // Affichage en String
                    ]),
                  )
                      .toList(),
                ),
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
