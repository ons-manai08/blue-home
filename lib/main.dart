import 'package:blue_home/screens/GardenScreen.dart';
import 'package:blue_home/screens/HistoryScreen.dart';
import 'package:blue_home/screens/RegisterPage.dart';
import 'package:blue_home/screens/statisticsScreen.dart';
import 'package:blue_home/screens/WelcomePage.dart';
import 'package:blue_home/screens/dashboard_screen.dart';
import 'package:blue_home/screens/login.dart';
import 'package:blue_home/screens/settings_screen.dart';
import 'package:blue_home/screens/water_consumption_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation Firebase
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAgIupWbAO3tawrtKtFTx3LMJ_mPl62q7s",
        authDomain: "bluehome-6b150.firebaseapp.com",
        databaseURL: "https://bluehome-6b150.firebaseio.com",  // Ensure this URL is correct
        projectId: "bluehome-6b150",
        storageBucket: "bluehome-6b150.firebasestorage.app",
        messagingSenderId: "545885160023",
        appId: "1:545885160023:web:65ec650956055273c9d912",
        measurementId: "G-XL7C95S53Z",
      ),
    );
    print("Firebase initialisé avec succès");
  } catch (e) {
    print("Erreur lors de l'initialisation de Firebase : $e");
  }



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blue Home',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/welcome',
      getPages: [
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/garden', page: () => GardenScreen(status: 1,)),
        GetPage(name: '/statistics', page: () => StatisticsScreen()),
        GetPage(name: '/water-consumption', page: () => WaterConsumptionScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/history', page: () => HistoryScreen()), // À créer plus tard
      ],
    );
  }
}
