import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appState.userName,
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 8),
                  Text(
                    '${appState.points}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(color: Colors.black.withOpacity(1)),
          ),
        ),
        body: Center(child: Text("Shop Page")));
  }
}
