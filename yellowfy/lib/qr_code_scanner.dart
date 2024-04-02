import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import "package:yellowfy/app.dart";
import "package:yellowfy/qr_overlay.dart";



class QRScannerPage extends StatefulWidget {
  final String id;

  const QRScannerPage(this.id);

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool isScanCompleted = false;
  
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
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates
                    ),
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        if(!isScanCompleted) {
                          String points = barcode.rawValue ?? '0' ;    // Result of Scanning the QR code = amount of points it gives
                          appState.addPoints(int.parse(points));
                          isScanCompleted = true;
                          appState.isUnlocked[widget.id] = true;
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => MainPage()
                            )
                          );
                        }
                      }  
                    },
                  ),
                  const QRScannerOverlay(overlayColour: Color(0xFFFAFAFA),)
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}