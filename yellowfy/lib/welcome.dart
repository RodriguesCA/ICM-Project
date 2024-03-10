import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
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
                    style: TextStyle(fontSize: 34),
                  ),
                  Text(
                    'to',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text(
                    'FindingAveiro',
                    style: TextStyle(fontSize: 34),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: appState.currentLanguage == "PT",
              child: Column(
                children: [
                  Text(
                    'Bemvindo',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text(
                    'a',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text(
                    'FindingAveiro',
                    style: TextStyle(fontSize: 34),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  if (appState.currentLanguage == "EN")
                    Text(
                      'Name: ',
                      style: TextStyle(fontSize: 18),
                    ),
                  if (appState.currentLanguage == "PT")
                    Text(
                      'Nome: ',
                      style: TextStyle(fontSize: 18),
                    ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 2.0),
                      ),
                      onChanged: (value) {
                        setState(() {
                          appState.userName = value;
                        });
                      },
                    ),
                  ),
                  if (appState.userName.isNotEmpty)
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                ],
              ),
            ),
            SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    appState.currentLanguage,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 5),
                  DropdownButton<String>(
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        appState.currentLanguage = newValue!;
                      });
                    },
                    items: appState.language.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}