import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:yellowfy/welcome.dart";
import "package:yellowfy/shop.dart";
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

void _showMarkerPopup(BuildContext context, String title, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(
                height: 10), // Optional spacing between description and button
            ElevatedButton(
              onPressed: () {
                // Navigate to QR code scanner page
                // Navigator.push(
                //context,
                // MaterialPageRoute(builder: (context) => QRScannerPage()),
                // );
              },
              child: Text('Scan QR Code'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
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

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  List<LatLng> polygonPointsIT = [
    LatLng(40.63787867676456, -8.65856742392844), // top left corner
    LatLng(40.63361546575474, -8.661243742835701), // bottom left corner
    LatLng(40.62004155057745, -8.658948487500192), // bottom right corner
    LatLng(40.62452855358944, -8.64976460361052), // top right corner
  ];
  List<LatLng> polygonPointsParqueMacaca = [
    LatLng(40.63272744890467, -8.64855518938427), // top right corner
    LatLng(40.63338985277366, -8.648786538128617), // extra
    LatLng(40.6399927705059, -8.655116460602876), // top left corner
    LatLng(40.63787867676456, -8.65856742392844), // bottom left corner
    LatLng(40.63056521992064, -8.654170248456797), // bottom right corner
  ];
  List<LatLng> polygonPointsSalinas = [
    LatLng(40.64584894137766, -8.662885293949005), // top left corner
    LatLng(40.6366802512532, -8.686951856569015), // extra
    LatLng(40.63755790248674, -8.687716520992657), // extra
    LatLng(40.63754339594855, -8.6886914681328), // extra
    LatLng(40.626249207879724, -8.682347226061006), // bottom right corner
    LatLng(40.63787867676456, -8.65856742392844), // top right corner
    LatLng(40.639593752531106, -8.655944809760609), // extra
  ];
  List<LatLng> polygonPointsBarra = [
    LatLng(40.63754339594855, -8.6886914681328), // top right corner
    LatLng(40.630624731442886, -8.750970539177398), // bottom right corner
    LatLng(40.640469790728964, -8.75011962660272), // extra
    LatLng(40.64205154345762, -8.758143275839053), // extra
    LatLng(40.642417082386906, -8.757913786302257), // extra
    LatLng(40.64075503936687, -8.750588131372883), // extra
    LatLng(40.64413984641427, -8.749853123659687), // bottom left corner
    LatLng(40.65825001627285, -8.719445773361878), // extra
    LatLng(40.65896005972578, -8.709161235108828), // extra
    LatLng(40.65476769594774, -8.702753020122302), // extra
  ];
  List<LatLng> polygonPointsCostaNova = [
    LatLng(40.63754339594855, -8.6886914681328), // top left corner
    LatLng(40.630624731442886, -8.750970539177398), // bottom left corner
    LatLng(40.608877485635745, -8.75648653881182), // bottom right corner
    LatLng(40.6005038853122, -8.690439825852636), // top right corner
    LatLng(40.626249207879724, -8.682347226061006), // extra
  ];
  List<LatLng> polygonPointsPassadicos = [
    LatLng(40.626249207879724, -8.682347226061006), // bottom right corner
    LatLng(40.6005038853122, -8.690439825852636), // extra
    LatLng(40.615252910083306, -8.677101677162222), // bottom left corner
    LatLng(40.62004155057745, -8.658948487500192), // top left corner
    LatLng(40.63361546575474, -8.661243742835701), // extra
    LatLng(40.63787867676456, -8.65856742392844), // top right corner
  ];
  // AFONSO ADICIONA AQUI OS OUTROS ARRAYS QUE FALTAM

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
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(40.6011, -8.67039), zoom: 11.05),
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(40.63124776919864, -8.65833370283157),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Universidade de Aveiro",
            ),
            onTap: () {
              _showMarkerPopup(context, "Universidade de Aveiro",
                  "Description of the University");
            },
          ),
          Marker(
            markerId: MarkerId("2"),
            position: LatLng(40.63617226081232, -8.652882809036974),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Parque da Macaca",
            ),
          ),
          Marker(
            markerId: MarkerId("3"),
            position: LatLng(40.64176461783421, -8.649972708817357),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Ponte do laço",
            ),
          ),
          Marker(
            markerId: MarkerId("3"),
            position: LatLng(40.62972748764886, -8.663462291914996),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Posto de observação da Marinha de Santiago",
            ),
          ),
          Marker(
            markerId: MarkerId("4"),
            position: LatLng(40.64133876097525, -8.753384474257963),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Paredão da Barra",
            ),
          ),
          Marker(
            markerId: MarkerId("5"),
            position: LatLng(40.6430253320752, -8.747768730329302),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Farol da Barra",
            ),
          ),
          Marker(
            markerId: MarkerId("6"),
            position: LatLng(40.61320949382517, -8.749690353509733),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Casas da Costa Nova",
            ),
          ),
          Marker(
            markerId: MarkerId("7"),
            position: LatLng(40.61763082057533, -8.75341613219714),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Praia da Costa Nova",
            ),
          ),
          Marker(
            markerId: MarkerId("8"),
            position: LatLng(40.64519314854355, -8.6627333933357),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: "Salinas de Aveiro",
            ),
          ),
          // Adicionar Fábrica, Praça, Estação (?)
        },
        polygons: {
          Polygon(
            polygonId: PolygonId("1"),
            points: polygonPointsIT,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: PolygonId("2"),
            points: polygonPointsParqueMacaca,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: PolygonId("3"),
            points: polygonPointsSalinas,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: PolygonId("4"),
            points: polygonPointsBarra,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: PolygonId("5"),
            points: polygonPointsCostaNova,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
          Polygon(
            polygonId: PolygonId(""),
            points: polygonPointsPassadicos,
            fillColor: Colors.grey,
            strokeWidth: 2,
          ),
        },
      ),
    );
  }
}
