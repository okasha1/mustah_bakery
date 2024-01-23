import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChanges => _auth.authStateChanges();

  //Login function
  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (e) {
      throw e.toString();
    }
  }

  //Get current user
  Future<User?> firebaseUser() async => _auth.currentUser;

//Sign up function
  Future<bool> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
