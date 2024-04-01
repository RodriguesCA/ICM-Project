import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
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
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(color: Colors.black.withOpacity(1)),
          ),
        ),
        body: Center(
            child: QrImageView(
          data: appState.userName,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        )));
  }
}
