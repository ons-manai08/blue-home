import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class KitchenScreen extends StatefulWidget {
  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  int flameDetected = 0;
  int gasDetected = 0;
  int waterFlow = 0;

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
          flameDetected = data['Flame_Detected'] ?? 0;
          gasDetected = data['Gas_Detected'] ?? 0;
          waterFlow = data['Water_Flow'] ?? 0;
        });
        print("Flame: $flameDetected, Gas: $gasDetected, Water Flow: $waterFlow");
      } else {
        print("Les données ne sont pas sous forme de Map.");
      }
    });
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
                      title: "Gaz",
                      detected: gasDetected == 1,
                      description: gasDetected == 1 ? "Alerte: Gaz Détecté" : "Aucun Gaz",
                      icon: Icons.gas_meter,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: _buildSensorCard(
                      title: "Water Leak",
                      detected: waterFlow > 0,
                      description: waterFlow > 0 ? "$waterFlow L/min" : "Pas de fuite",
                      icon: Icons.water_drop,
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
                      title: "Fire ",
                      detected: flameDetected == 1,
                      description: flameDetected == 1 ? "Alerte: Flamme Détectée" : "Aucune Flamme",
                      icon: Icons.local_fire_department,
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
    required bool detected,
    required String description,
    required IconData icon,
  }) {
    // La couleur de fond change en fonction du statut détecté ou non
    final Color backgroundColor = detected ? Color(0xFF2E79E6) : Colors.white;
    // La couleur du texte change en fonction de la couleur de fond
    final Color textColor = detected ? Colors.white : Color(0xFF2E79E6);

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
            left: 9,
            top: 11,
            child: Container(
              width: 169,
              height: 45,
              decoration: ShapeDecoration(
                color: detected ? Colors.blueAccent : Colors.grey, // Barre supérieure
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
                          fontSize: 23.17,
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
                        description,
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
              child: Icon(icon, color: textColor, size: 24), // Icône dynamique
            ),
          ),
        ],
      ),
    );
  }
}
