import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class GardenScreen extends StatefulWidget {
  @override
  _GardenScreenState createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  double humidity = 0.0;
  double temperature = 0.0;
  int rainDetected = 0;
  int gasDetected = 0;
  int waterLevel = 0;
  String soilStatus = "sec"; // Par défaut, le sol est sec

  @override
  void initState() {
    super.initState();
    _getSensorData();
  }

  void _getSensorData() {
    _database.child('sensorData').onValue.listen((event) {
      final data = event.snapshot.value;

      if (data is Map<dynamic, dynamic>) {
        setState(() {
          humidity = data['Humidity'] ?? 0.0;
          temperature = data['Temperature'] ?? 0.0;
          rainDetected = data['Rain_Detected'] ?? 0;
          gasDetected = data['Gas_Detected'] ?? 0;
          waterLevel = data['Water_Level'] ?? 0;
          soilStatus = data['Soil_Status'] ?? "sec";
        });

        _checkAlerts(); // Vérifier les alertes après avoir récupéré les données

        print("Humidity: $humidity, Temperature: $temperature, Rain Detected: $rainDetected, Gas Detected: $gasDetected, Water Level: $waterLevel, Soil Status: $soilStatus");
      } else {
        print("Les données ne sont pas sous forme de Map.");
      }
    });
  }

  void _checkAlerts() {
    // Alerte de pluie
    if (rainDetected == 1) {
      _showAlert("Alerte Pluie", "Il pleut. Veuillez prendre les mesures nécessaires.");
    }

    // Alerte si le sol est sec
    if (soilStatus == "sec") {
      _showAlert("Alerte Sol", "Le sol est sec. Veuillez l'arroser.");
    }

    // Alerte si le niveau d'eau est inférieur à 70% et qu'il pleut
    if (rainDetected == 1 && waterLevel < 70) {
      _showAlert("Alerte Réservoir", "Il pleut et le niveau d'eau est inférieur à 70%. Ouvrez le réservoir.");
    }
  }


  void _showAlert(String title, String message) {
    // Fonction pour afficher une alerte (par exemple, une boîte de dialogue)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Permettre le défilement pour éviter l'overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded( // Pour occuper tout l'espace disponible
                    child: _buildSensorCard(
                      title: "Humidité",
                      value: humidity.toStringAsFixed(1) + " %",
                      backgroundColor: Colors.white, // Fond blanc
                      icon: Icons.water_drop,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: _buildSensorCard(
                      title: "Température",
                      value: temperature.toStringAsFixed(1) + " °C",
                      backgroundColor: Colors.white, // Fond blanc
                      icon: Icons.thermostat,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildSensorCard(
                      title: "Pluie",
                      value: rainDetected == 1 ? "Pluie détectée" : "Pas de pluie",
                      backgroundColor: rainDetected == 1 ? Colors.blueAccent : Colors.white,
                      icon: Icons.umbrella, // Icône pour la pluie
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: _buildSensorCard(
                      title: "Sol",
                      value: soilStatus == "humide" ? "Sol humide" : "Sol sec",
                      backgroundColor: soilStatus == "humide" ? Colors.white : Colors.blueAccent,
                      icon: Icons.eco, // Icône pour le sol
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildSensorCard(
                      title: "Réservoir d'eau",
                      value: waterLevel.toString() + "%",
                      backgroundColor: Colors.white, // Fond blanc
                      icon: Icons.water,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour construire les cartes de capteur avec gestion dynamique des couleurs et icônes
  Widget _buildSensorCard({
    required String title,
    required String value,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final Color textColor = backgroundColor == Colors.white ? Colors.black : Colors.white;

    return Container(
      width: 187.34,
      height: 172.13,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 187.34,
              height: 172.13,
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.02),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x423880F6),
                    blurRadius: 36,
                    offset: Offset(0, 16),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 187.34,
              height: 45,
              decoration: ShapeDecoration(
                color: backgroundColor == Colors.white ? Colors.grey[300]! : Colors.blueAccent, // Barre supérieure
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 17,
            top: 103,
            child: Container(
              width: 146.27,
              height: 48,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 129.66,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: textColor, // Couleur du texte
                          fontSize: 18.0, // Taille de la police réduite
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.28,
                    top: 31,
                    child: SizedBox(
                      width: 145.99,
                      height: 17,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: textColor.withOpacity(0.8), // Texte plus clair
                          fontSize: 12.26,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 78,
            top: 17,
            child: Container(
              width: 35,
              height: 35,
              child: Icon(icon, color: textColor, size: 24), // Icône
            ),
          ),
        ],
      ),
    );
  }
}
