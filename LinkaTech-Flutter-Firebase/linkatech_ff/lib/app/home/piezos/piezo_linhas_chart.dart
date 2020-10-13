import 'package:flutter/material.dart';
import 'package:linkatech_ff/app/home/piezos/piezo_linhas.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PiezoLinhasChart extends StatelessWidget {
  PiezoLinhasChart({@required this.data});
  final List<PiezoLinhasModel> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PiezoLinhasModel, String>> series = [
      charts.Series(
        id: "Subs",
        data: data,
        domainFn: (PiezoLinhasModel series, _) => series.year,
        measureFn: (PiezoLinhasModel series, _) => series.subs,
        colorFn: (PiezoLinhasModel series, _) => series.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'PORCARIA',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
