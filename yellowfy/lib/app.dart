import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/welcome.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(54, 201, 255, 1)),
          useMaterial3: true,
        ),
        home: WelcomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String userName = '';
	List<String> language = ["PT", "EN"];
  String currentLanguage = "EN";
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main Page'),
      ),
    );
  }
}