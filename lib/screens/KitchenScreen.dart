import 'package:flutter/material.dart';

class KitchenScreen extends StatelessWidget {
  // Fonction qui détermine la couleur de la carte en fonction de l'état
  Color _getCardColorForStatus() {
    return Colors.blue; // Exemple de couleur
  }

  // Fonction qui détermine la couleur de la barre supérieure de la carte
  Color _getTopBarColorForStatus() {
    return Colors.blue.shade900; // Exemple de couleur
  }

  // Fonction qui retourne le titre dynamique pour chaque carte
  String _getTitleForStatus(int index) {
    switch (index) {
      case 0:
        return "Gaz détecté";
      case 1:
        return "Flamme détectée";
      case 2:
        return "Débit d'eau";
      default:
        return "Statut inconnu";
    }
  }

  // Fonction qui retourne la description dynamique pour chaque carte
  String _getDescriptionForStatus(int index) {
    switch (index) {
      case 0:
        return "Il y a du gaz détecté dans la cuisine";
      case 1:
        return "Flamme détectée dans la cuisine";
      case 2:
        return "Il y a une fuite d'eau dans la cuisine";
      default:
        return "Description inconnue";
    }
  }

  // Fonction qui retourne l'icône dynamique pour chaque carte
  Icon _getIconForStatus(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.gas_meter, color: Colors.white, size: 35); // Icône de gaz
      case 1:
        return Icon(Icons.local_fire_department, color: Colors.white, size: 35); // Icône de flamme
      case 2:
        return Icon(Icons.water_damage, color: Colors.white, size: 35); // Icône de fuite d'eau
      default:
        return Icon(Icons.error, color: Colors.white, size: 35); // Icône d'erreur
    }
  }

  // Fonction qui retourne un nombre dynamique pour la fuite d'eau
  String _getWaterLeakCount(int index) {
    if (index == 2) {
      return "3"; // Exemple de nombre pour la fuite d'eau
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Première ligne avec deux cartes côte à côte
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Première carte
                Container(
                  width: 187.34,
                  height: 172.13,
                  margin: EdgeInsets.only(right: 10), // Espace entre les cartes
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 187.34,
                          height: 172.13,
                          decoration: ShapeDecoration(
                            color: _getCardColorForStatus(), // Couleur dynamique
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.02),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFF3D86F7),
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
                            color: _getTopBarColorForStatus(), // Couleur de la barre supérieure
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
                                    _getTitleForStatus(0), // Titre dynamique
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
                                    _getDescriptionForStatus(0), // Description dynamique
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
                        child: _getIconForStatus(0), // Icône dynamique
                      ),
                    ],
                  ),
                ),
                // Deuxième carte
                Container(
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
                            color: _getCardColorForStatus(), // Couleur dynamique
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.02),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFF3D86F7),
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
                            color: _getTopBarColorForStatus(), // Couleur de la barre supérieure
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
                                    _getTitleForStatus(1), // Titre dynamique
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
                                    _getDescriptionForStatus(1), // Description dynamique
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
                        child: _getIconForStatus(1), // Icône dynamique
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Carte en bas
            Container(
              width: 387.69,
              height: 172.13,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 387.69,
                      height: 172.13,
                      decoration: ShapeDecoration(
                        color: _getCardColorForStatus(), // Couleur dynamique
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.02),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xFF3D86F7),
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
                        color: _getTopBarColorForStatus(), // Couleur de la barre supérieure
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
                                _getTitleForStatus(2), // Titre dynamique
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
                                _getDescriptionForStatus(2), // Description dynamique
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
                    child: _getIconForStatus(2), // Icône dynamique
                  ),
                  Positioned(
                    left: 156,
                    top: 88,
                    child: Text(
                      _getWaterLeakCount(2), // Nombre dynamique pour la fuite d'eau
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
