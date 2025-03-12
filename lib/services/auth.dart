import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Email + password sign in
  Future<UserCredential> signInEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }

  // Email + password sign up
  Future<UserCredential> signUpEmailPassword(
    String email,
    String password,
    String cfmPassword,
  ) async {
    try {
      if (password == cfmPassword) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        return credential;
      } else {
        throw Exception("Passwords do not match");
      }
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }
}
