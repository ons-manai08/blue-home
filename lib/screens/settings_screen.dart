import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView( // Permet le défilement si nécessaire
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
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
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLimitSection('Humidity Limit (C)'),
                const SizedBox(height: 10),
                _buildLimitSection('Temperature Limit'),
                const SizedBox(height: 10),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),  // Ajout de la barre de navigation en bas
    );
  }

  // Méthode pour construire chaque section de limite
  Widget _buildLimitSection(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF6F7EA8),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(text: 'Your text here'), // Ajoutez votre texte ici
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 32,
            height: 32,
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }

  // Méthode pour construire les boutons d'action
  Widget _buildActionButtons() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionButton('Cancel'),
          _buildActionButton('Save'),
        ],
      ),
    );
  }

  // Méthode pour construire un bouton d'action
  Widget _buildActionButton(String label) {
    return Container(
      width: 78,
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: ShapeDecoration(
        color: Color(0xFF3580EE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
      ),
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

  // Méthode pour construire chaque icône de navigation
  Widget _buildNavIcon(IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => Get.toNamed(route),
    );
  }
}
