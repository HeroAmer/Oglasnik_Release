import 'package:Oglasnik/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AnonymousInterface {
  Future getAnonymous();
}

abstract class RegisteredUserInterface {
  Future getRegisterUser();
}

abstract class AuthCrud {
  Stream<User> get user;
}

abstract class AuthSignOut {
  Future signOut();
}

abstract class AuthRegisterWithEmailAndPassword {
  Future registerWithEmailAndPassword(
      String email, String password, String fullName, String phoneNumber);
}

abstract class AuthSignInWithEmailAndPassword {
  Future signInWithEmailAndPassword(String email, String password);
}

abstract class AuthSignInAnon {
  Future signInAnon();
}

abstract class AuthuserFromFirebaseUser {
  User userFromFirebaseUser(FirebaseUser user);
}
