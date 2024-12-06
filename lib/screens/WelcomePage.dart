import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50), // Pour déplacer le contenu un peu vers le bas
            // Image de bienvenue en haut
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Utilisez votre chemin d'image
                height: 200, // Ajustez la hauteur si nécessaire
              ),
            ),
            SizedBox(height: 40),
            // Texte de bienvenue avec emoji
            Center(
              child: Text(
                'Welcome 👋!', // Emoji de salutation dans le texte
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Bouton rempli pour "Login"
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login'); // Navigation vers la page de connexion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C6D94), // Couleur de fond du bouton
                padding: EdgeInsets.symmetric(vertical: 15), // Ajuster la hauteur du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Couleur du texte du bouton
                ),
              ),
            ),
            SizedBox(height: 16),
            // Bouton contourné pour "Register"
            OutlinedButton(
              onPressed: () {
                Get.toNamed('/register'); // Navigation vers la page d'inscription
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF2C6D94), width: 2), // Couleur de la bordure
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF2C6D94), // Couleur du texte correspondant à la bordure
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}