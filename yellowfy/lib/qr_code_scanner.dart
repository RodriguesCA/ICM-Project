import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";
import 'package:qr_flutter/qr_flutter.dart';


class QRScannerPage extends StatefulWidget {
  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool isScanCompleted = false;

  void closeScreen() { isScanCompleted = false; }

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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),  
                  ),
                ],
              )
            ),
            //Expanded(
            //  flex: 4,
            //  child: // MobileScanner(
                //onDetect: (barcode) {
                //  if(!isScanCompleted) {
                //    String code = barcode.raw ?? '---' ;    // Result of Scanning the QR code
                //   isScanCompleted = true;
                //    Navigator.push(
                //      context, 
                //      MaterialPageRoute(
                //        builder: (context) => MainPage()
                //      )
                //    );
                //   }
             //  },
            //  )
          //  ),
          ],
        ),
      )
    );
  }
}