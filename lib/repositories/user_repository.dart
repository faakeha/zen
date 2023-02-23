import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zen/models/user_json.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;
  FirebaseAuth fa = FirebaseAuth.instance;

  Future<void> addUser(UserJson newUser) async {
    await db
        .collection("Users")
        .add(newUser.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print('Error: ' + error));
  }

  Future<void> deleteUser(UserJson delUser) async {
    await db
        .collection("Users")
        .doc(delUser.id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print('Error: ' + error));
  }

  Future<void> updateUser(UserJson updateUser) async {
    await db
        .collection("Users")
        .doc(updateUser.id)
        .set(updateUser.toJson())
        .then((value) => print("User updated successfully"))
        .catchError((error) => print('Error: ' + error));
  }

  Future signUp(String email, String password) async {
    User? user;
    try {
      UserCredential userCred = await fa.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCred.user;
      return user;
    } catch (e) {
      return e;
    }
  }

  Future<User?> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found with this email and password");
      }
    }
    return user;
  }
}
