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

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  List<LatLng> polygonPointsIT = [
    LatLng(40.63787867676456, -8.65856742392844),  // top left corner
    LatLng(40.63361546575474, -8.661243742835701),  // bottom left corner
    LatLng(40.62004155057745, -8.658948487500192),  // bottom right corner
    LatLng(40.62452855358944, -8.64976460361052),   // top right corner
  ];
  List<LatLng> polygonPointsParqueMacaca = [
    LatLng(40.63272744890467, -8.64855518938427),  // top right corner
    LatLng(40.63338985277366, -8.648786538128617),  // extra
    LatLng(40.6399927705059, -8.655116460602876),  // top left corner
    LatLng(40.63787867676456, -8.65856742392844),  // bottom left corner
    LatLng(40.63056521992064, -8.654170248456797),  // bottom right corner
  ];
  List<LatLng> polygonPointsSalinas = [
    LatLng(40.64584894137766, -8.662885293949005),  // top left corner
    LatLng(40.6366802512532, -8.686951856569015),   // extra
    LatLng(40.63755790248674, -8.687716520992657),  // extra
    LatLng(40.63754339594855, -8.6886914681328),    // extra
    LatLng(40.626249207879724, -8.682347226061006), // bottom right corner
    LatLng(40.63787867676456, -8.65856742392844),   // top right corner
    LatLng(40.639593752531106, -8.655944809760609), // extra
  ];
  List<LatLng> polygonPointsBarra = [
    LatLng(40.63754339594855, -8.6886914681328),    // top right corner
    LatLng(40.630624731442886, -8.750970539177398), // bottom right corner
    LatLng(40.640469790728964, -8.75011962660272),  // extra
    LatLng(40.64205154345762, -8.758143275839053),  // extra
    LatLng(40.642417082386906, -8.757913786302257), // extra
    LatLng(40.64075503936687, -8.750588131372883),  // extra
    LatLng(40.64413984641427, -8.749853123659687),  // bottom left corner
    LatLng(40.65825001627285, -8.719445773361878),  // extra
    LatLng(40.65896005972578, -8.709161235108828),  // extra
    LatLng(40.65476769594774, -8.702753020122302),  // extra
  ];
  List<LatLng> polygonPointsCostaNova = [
    LatLng(40.63754339594855, -8.6886914681328),    // top left corner
    LatLng(40.630624731442886, -8.750970539177398), // bottom left corner
    LatLng(40.608877485635745, -8.75648653881182),  // bottom right corner
    LatLng(40.6005038853122, -8.690439825852636),   // top right corner
    LatLng(40.626249207879724, -8.682347226061006), // extra
  ];
  List<LatLng> polygonPointsPassadicos = [
    LatLng(40.626249207879724, -8.682347226061006), // bottom right corner
    LatLng(40.6005038853122, -8.690439825852636),   // extra
    LatLng(40.615252910083306, -8.677101677162222), // bottom left corner
    LatLng(40.62004155057745, -8.658948487500192),  // top left corner
    LatLng(40.63361546575474, -8.661243742835701),  // extra
    LatLng(40.63787867676456, -8.65856742392844),  // top right corner
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
          // Adicionar Paredão da Barra, Farol da Barra, Casas da Costa Nova, Praia da Costa Nova, Salinas, Passadiços de Aveiro, Uni/Ponte do Crasto (?), Fábrica, Praça, Estação (?)
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
