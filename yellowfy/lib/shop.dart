import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellowfy/app.dart';
import 'package:yellowfy/qr_page.dart';

class ShopPage extends StatelessWidget {
  final List<Offer> offers = [
    Offer(name: 'Ramona', pointsRequired: 100, discount: 10),
    Offer(name: 'Moliceiro Ride', pointsRequired: 200, discount: 10),
    Offer(name: 'Tripas da Praça', pointsRequired: 300, discount: 50),
    Offer(name: 'Confeitaria Peixinho', pointsRequired: 500, discount: 30),
    Offer(name: 'X&Records', pointsRequired: 1000, discount: 50),
    Offer(name: 'Museu de Aveiro', pointsRequired: 2000, discount: 50),
    Offer(name: 'SublimeVilla', pointsRequired: 5000, discount: 50),
    Offer(name: 'Milano', pointsRequired: 10000, discount: 50),
  ];
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
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          final offer = offers[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(offer.name),
              subtitle: Text(
                  'Points Required: ${offer.pointsRequired}\nDiscount: ${offer.discount}%'),
              trailing: ElevatedButton(
                onPressed: () {
                  if (appState.points >= offer.pointsRequired) {
                    // Deduct points
                    appState.points -= offer.pointsRequired;
                    // Navigate to QRPage and pass offer data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRPage(),
                      ),
                    );
                  } else {
                    // Show insufficient points message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Insufficient Points'),
                          content: Text(
                              'You need ${offer.pointsRequired - appState.points} more points to redeem this offer.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Redeem'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Offer {
  final String name;
  final int pointsRequired;
  final int discount;

  Offer({
    required this.name,
    required this.pointsRequired,
    required this.discount,
  });
}
