import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:yellowfy/welcome.dart";
import "package:yellowfy/shop.dart";

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
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(54, 201, 255, 1)),
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

  get points => 0;

  set password(password) {}
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appState.userName,
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(40.6011, -8.67039), zoom: 11.05),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            compassEnabled: false,
            mapToolbarEnabled: false,
            zoomGesturesEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            markers: {
              Marker(
                markerId: MarkerId("1"),
                position: LatLng(40.6332, -8.6595),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                infoWindow: InfoWindow(
                  title: "DETI",
                  snippet: "Central da depressão",
                ),
              ),
              Marker(
                markerId: MarkerId("2"),
                position: LatLng(40.6364, -8.6531),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                infoWindow: InfoWindow(
                  title: "Parque da Macaca",
                  snippet: "Central do Assalto",
                ),
              ),
              // make another marker for praça do peixe in aveiro
              Marker(
                markerId: MarkerId("3"),
                position: LatLng(40.6441, -8.6564),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                infoWindow: InfoWindow(
                  title: "Ponte do laço",
                  snippet: "Che grande beijo",
                ),
              ),
              Marker(
                markerId: MarkerId("3"),
                position: LatLng(40.6341, -8.6600),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                infoWindow: InfoWindow(
                  title: "IT",
                  snippet: "Money Grabers",
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
