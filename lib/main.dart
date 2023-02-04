import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zen/screens/welcome/welcome_screen.dart';
import 'package:zen/screens/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zen',
      theme: ThemeData(
        primaryColor: primaryColorPeach,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: WelcomeScreen(),
    );
  }
}
