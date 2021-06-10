import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PiezoLinhasChart extends StatefulWidget {
  @override
  _CarregarDadosFirestore createState() => _CarregarDadosFirestore();
}

class _CarregarDadosFirestore extends State<PiezoLinhasChart> {
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

  // int i = 1;
  Widget _showDrivers() {
    if (querySnapshot != null) {
      //return Container(
      return ListView.builder(
        primary: false,
        itemCount: 1,
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
          total = (total / length).ceil();
          total2 = (total2 / length).ceil();
          total3 = (total3 / length).ceil();
          total4 = (total4 / length).ceil();
          total5 = (total5 / length).ceil();
          // int finalTotal = total + total2 + total3 + total4 + total5;

          // double porcentoTotal = (total * 100) / finalTotal;
          // double porcentoTotal2 = (total2 * 100) / finalTotal;
          // double porcentoTotal3 = (total3 * 100) / finalTotal;
          // double porcentoTotal4 = (total4 * 100) / finalTotal;
          // double porcentoTotal5 = (total5 * 100) / finalTotal;

          // Widget build(BuildContext context) {
          var data = [
            PiezoPieAtributos('A11', total, Colors.black),
            PiezoPieAtributos('A12', total2, Colors.red),
            PiezoPieAtributos('A13', total3, Colors.green),
            PiezoPieAtributos('A14', total4, Colors.purple),
            PiezoPieAtributos('A15', total5, Colors.grey),
          ];

          var series = [
            charts.Series(
              domainFn: (PiezoPieAtributos clickData, __) => clickData.piezo,
              measureFn: (PiezoPieAtributos clickData, __) => clickData.valor,
              colorFn: (PiezoPieAtributos clickData, __) => clickData.color,
              id: 'Teste',
              data: data,
            ),
          ];

          var chart = charts.BarChart(
            series,
            animate: true,
          );

          var chartWidget = Padding(
            padding: EdgeInsets.all(32),
            child: SizedBox(
              height: 500,
              child: chart,
            ),
          );

          return Column(
            children: <Widget>[
              // Text("${querySnapshot.documents[i].data['A11']}"),
              // Text(total.toString()),
              // Text(total2.toString()),
              // Text(total3.toString()),
              // Text(total4.toString()),
              // Text(total5.toString()),
              // Text(i.toString()),
              chartWidget,
            ],
          );
        },
      );

      //),
      //     );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

getDriverList() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final Firestore firestore = Firestore.instance;

  FirebaseUser user = await auth.currentUser();
  final userid = user.email;

  // const usedId = Firestore.
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  return await Firestore.instance
      .collection('/linkatech/$userid/piezos/2020-10-13T07:50:55.914150/piezos')
      //collection('/linkatech/$userid/piezos/')
      .getDocuments();
}

class PiezoPieAtributos {
  final String piezo;
  final int valor;
  final charts.Color color;

  PiezoPieAtributos(this.piezo, this.valor, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
