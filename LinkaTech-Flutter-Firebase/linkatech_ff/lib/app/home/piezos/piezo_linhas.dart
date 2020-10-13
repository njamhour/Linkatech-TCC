import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_linhas_chart.dart';

class PiezoLinhasModel {
  PiezoLinhasModel({
    @required this.year,
    @required this.subs,
    @required this.barColor,
  });
  final String year;
  final int subs;
  final charts.Color barColor;
}

class PiezoLinhas extends StatelessWidget {
  final List<PiezoLinhasModel> data = [
    PiezoLinhasModel(
        year: "2000",
        subs: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PiezoLinhasModel(
        year: "2001",
        subs: 200000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PiezoLinhasModel(
        year: "2002",
        subs: 300000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PiezoLinhasModel(
        year: "2003",
        subs: 400000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Teste'),
      ),
      body: Center(
        child: PiezoLinhasChart(data: data),
      ),
    );
  }
}
