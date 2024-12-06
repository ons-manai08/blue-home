import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> loginUser(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Erreur de connexion: $e');
      return null;
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.sendEmailVerification(); // Envoi de l'email de vérification
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'emailVerified': false,
      });
    } catch (e) {
      print('Erreur lors de l\'inscription: $e');
    }
  }

  // Méthode pour récupérer les détails de l'utilisateur depuis Firestore
  Future<String?> getUserFirstName() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        return userDoc['name'];
      }
    } catch (e) {
      print('Erreur lors de la récupération du prénom: $e');
    }
    return null;
  }

}
