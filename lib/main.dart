import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poetsen One'),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
