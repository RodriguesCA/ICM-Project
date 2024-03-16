import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text('FindingAveiro'),
        backgroundColor: Colors.blueAccent[100],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.blueAccent[400]!],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              icon: Icon(Icons.language, color: Colors.white),
              onChanged: (String? newValue) {
                setState(() {
                  appState.currentLanguage = newValue!;
                });
              },
              items: appState.language
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.black)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Visibility(
                visible: appState.currentLanguage == "EN",
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    Text(
                      'to',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    Text(
                      'FindingAveiro',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.location_on, size: 50, color: Colors.white),
                  ],
                ),
              ),
              Visibility(
                visible: appState.currentLanguage == "PT",
                child: Column(
                  children: [
                    Text(
                      'Bemvindo',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    Text(
                      'a',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    Text(
                      'FindingAveiro',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.location_on, size: 50, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 200),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        appState.currentLanguage == "EN" ? 'Name' : 'Nome',
                    labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    border: OutlineInputBorder(gapPadding: 2.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      appState.userName = value;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: appState.currentLanguage == "EN"
                        ? 'Password'
                        : 'Palavra-passe',
                    labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    border: OutlineInputBorder(gapPadding: 2.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      appState.password = value;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text(
                  appState.currentLanguage == "EN" ? 'Login' : 'Login',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
