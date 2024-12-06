import 'package:flutter/material.dart';

class BathScreen extends StatelessWidget {
  final int status; // Variable pour le statut

  BathScreen({required this.status}); // Constructeur pour passer la valeur du statut

  @override
  Widget build(BuildContext context) {
    return _buildAlertSection();
  }

  Widget _buildAlertSection() {
    return Container(
      width: 387.69,
      height: 172.13,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      color: _getCardColorForStatus(), // Couleur de la carte selon le statut
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
                              _getTitleForStatus(), // Titre dynamique
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
                              _getDescriptionForStatus(), // Description dynamique
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
                    child: Icon(Icons.water_drop, color: Colors.white, size: 24), // Icône d'eau
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour obtenir le titre en fonction du statut
  String _getTitleForStatus() {
    return 'Water Flow'; // Le titre pour la carte de débit d'eau
  }

  // Méthode pour obtenir la description en fonction du statut
  String _getDescriptionForStatus() {
    return 'The water flow is normal'; // Description pour le débit d'eau
  }

  // Méthode pour obtenir la couleur de la carte en fonction du statut
  Color _getCardColorForStatus() {
    return Color(0xFF2E79E6); // Bleu pour le débit d'eau
  }

  // Méthode pour obtenir la couleur de la barre supérieure
  Color _getTopBarColorForStatus() {
    return Color(0xFF3D86F7); // Bleu clair pour la barre supérieure
  }
}
