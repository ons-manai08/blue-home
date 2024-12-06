import 'package:flutter/material.dart';

class GardenScreen extends StatelessWidget {
  final int status; // Variable pour le statut

  GardenScreen({required this.status}); // Constructeur pour passer la valeur du statut

  @override
  Widget build(BuildContext context) {
    return _buildAlertSection();
  }

  Widget _buildAlertSection() {
    return Container(
      padding: EdgeInsets.all(10), // Ajouter un peu d'espace autour de la section
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard(1), // Carte pour Temperature
              _buildCard(2), // Carte pour Rain Status
            ],
          ),
          SizedBox(height: 10), // Espacement entre les lignes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard(3), // Carte pour Water Container
              _buildCard(4), // Carte pour Humidity (nouvelle carte ajoutée)
            ],
          ),
        ],
      ),
    );
  }

  // Méthode générique pour construire les cartes en fonction du statut
  Widget _buildCard(int cardStatus) {
    return Container(
      width: 170,
      height: 172,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 170,
              height: 172,
              decoration: ShapeDecoration(
                color: _getCardColorForStatus(cardStatus),
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
                color: _getTopBarColorForStatus(cardStatus),
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
                        _getTitleForStatus(cardStatus),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.17,
                          fontWeight: FontWeight.w600,
                          height: 0,
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
                        _getDescriptionForStatus(cardStatus),
                        style: TextStyle(
                          color: Color(0xFFECF1FD),
                          fontSize: 12.26,
                          height: 0,
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
              child: _getIconForStatus(cardStatus),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour obtenir le titre en fonction du statut
  String _getTitleForStatus(int status) {
    switch (status) {
      case 1:
        return 'Temperature';
      case 2:
        return 'Rain Status';
      case 3:
        return 'Water Container';
      case 4:
        return 'Humidity'; // Nouvelle carte pour l'humidité
      default:
        return 'Unknown Status';
    }
  }

  // Méthode pour obtenir la description en fonction du statut
  String _getDescriptionForStatus(int status) {
    switch (status) {
      case 1:
        return 'Current temperature is high';
      case 2:
        return 'Rain status is moderate';
      case 3:
        return 'Water container is full';
      case 4:
        return 'Humidity is ideal'; // Description pour Humidity
      default:
        return 'Status unknown';
    }
  }

  // Méthode pour obtenir la couleur de la carte en fonction du statut
  Color _getCardColorForStatus(int status) {
    switch (status) {
      case 1:
        return Color(0xFF2E79E6); // Bleu pour Temperature
      case 2:
        return Color(0xFF3D86F7); // Orange pour Rain Status
      case 3:
        return Color(0xFF3D86F7); // Vert pour Water Container
      case 4:
        return Color(0xFF3D86F7); // Vert clair pour Humidity
      default:
        return Colors.white;
    }
  }

  // Méthode pour obtenir la couleur de la barre supérieure en fonction du statut
  Color _getTopBarColorForStatus(int status) {
    switch (status) {
      case 1:
        return Color(0xFF3D86F7); // Bleu pour Temperature
      case 2:
        return Color(0xFF3D86F7); // Orange pour Rain Status
      case 3:
        return Color(0xFF3D86F7); // Vert pour Water Container
      case 4:
        return Color(0xFF3D86F7); // Vert clair pour Humidity
      default:
        return Color(0xFF3D86F7);  // Gris clair pour statut inconnu
    }
  }

  // Méthode pour obtenir l'icône en fonction du statut
  Widget _getIconForStatus(int status) {
    switch (status) {
      case 1:
        return Icon(Icons.thermostat, color: Colors.white, size: 24); // Icône de température
      case 2:
        return Icon(Icons.cloud, color: Colors.white, size: 24); // Icône de pluie
      case 3:
        return Icon(Icons.water_drop, color: Colors.white, size: 24); // Icône de conteneur d'eau
      case 4:
        return Icon(Icons.water, color: Colors.white, size: 24); // Icône pour Humidity
      default:
        return Icon(Icons.error, color: Colors.white, size: 24); // Icône d'erreur
    }
  }
}
