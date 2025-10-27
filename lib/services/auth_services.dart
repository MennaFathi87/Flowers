import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register page
  Future<User?> register(String email, String password, String username) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCred.user!.updateDisplayName(username);
      return userCred.user;
    } catch (ex) {
      print('Error in register: $ex');
      return null;
    }
  }

//login page
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCred.user;
    } catch (ex) {
      print('Error in login: $ex');
      return null;
    }
  }

  // log out
  Future<void> logout() async {
    await _auth.signOut();
  }

 
}
