import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinytots/firebase_options.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/screens/home.dart';
import 'package:tinytots/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poetsen One'),
      debugShowCheckedModeBanner: false,
      home: isFirstTime ? const WelcomeScreen() : const HomeScreen(),
    );
  }
}
