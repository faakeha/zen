import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zen/models/user_json.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zen/screens/constants.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;
  FirebaseAuth fa = FirebaseAuth.instance;
  UserJson _user = UserJson.empty();

  Future<void> addUser(UserJson newUser) async {
    await db
        .collection("Users")
        .doc(newUser.id)
        .set(newUser.toJson())
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
        .update(updateUser.toJson())
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
    } on FirebaseException catch (e) {
      print(e);
      if(e.code == "invalid-email"){
        Fluttertoast.showToast(
            msg: "This email is invalid. Please try again.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 187, 213, 246),
            textColor: Colors.black,
            fontSize: 15
        );
      }
      if(e.code == "weak-password"){
        Fluttertoast.showToast(
            msg: "Password must be at least 6 characters long",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 187, 213, 246),
            textColor: Colors.black,
            fontSize: 15
        );
      }
      if(e.code == "email-already-in-use"){
        Fluttertoast.showToast(
            msg: "This email is already in use",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 187, 213, 246),
            textColor: Colors.black,
            fontSize: 15
        );
      }
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
      print(e);
      if (e.code == "user-not-found") {
        print("No User found with this email and password");
        Fluttertoast.showToast(
            msg: "No user found with this email and password",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 187, 213, 246),
            textColor: Colors.black,
            fontSize: 15
        );
      }

      if(e.code == "wrong-password"){
        Fluttertoast.showToast(
            msg: "Incorrect password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 187, 213, 246),
            textColor: Colors.black,
            fontSize: 15
        );
      }
    }
    return user;
  }

  Future<UserJson> getUser() async {
    String? id = fa.currentUser?.uid;
    print('ID$id');
    await db.collection("Users").doc(id).get().then((event) {
      _user = UserJson.fromJson(event.data() as Map<String, dynamic>, event.id);
    }).catchError(
            (error) => print("Failed to fetch user. Error : ${error}")); //

    return _user;
  }


}
