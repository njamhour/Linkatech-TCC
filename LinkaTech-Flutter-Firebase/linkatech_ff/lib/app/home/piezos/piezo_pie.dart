import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkatech_ff/services/api_path.dart';

class PiezoPie extends StatefulWidget {
  @override
  _CarregarDadosFirestore createState() => _CarregarDadosFirestore();
}

class _CarregarDadosFirestore extends State<PiezoPie> {
  @override
  void initState() {
    super.initState();
    getDriverList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showDrivers(),
    );
  }

  Widget _showDrivers() {
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, i) {
          int total = 0;
          int total2 = 0;
          int total3 = 0;
          int total4 = 0;
          int total5 = 0;
          int length = querySnapshot.documents.length - 1;

          for (i = 0; i <= length; i++) {
            total = total + querySnapshot.documents[i].data['A11'];
            total2 = total2 + querySnapshot.documents[i].data['A12'];
            total3 = total3 + querySnapshot.documents[i].data['A13'];
            total4 = total4 + querySnapshot.documents[i].data['A14'];
            total5 = total5 + querySnapshot.documents[i].data['A15'];
          }
          return Column(
            children: <Widget>[
              // Text("${querySnapshot.documents[i].data['A11']}"),
              Text(total.toString()),
              Text(total2.toString()),
              Text(total3.toString()),
              Text(total4.toString()),
              Text(total5.toString()),
            ],
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getDriverList() async {
    return await Firestore.instance
        .collection(
            '/linkatech/njjamhour@gmail.com/piezos/2020-10-13T07:50:55.914150/piezos')
        .getDocuments();
  }
}
