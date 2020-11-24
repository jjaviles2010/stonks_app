import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:stonks_app/home/models/linearWalletPosition.dart';

class StackedChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(_populateData(),
    defaultRenderer: charts.LineRendererConfig(includeArea: true, stacked: true, ),
    animate: true);
  }

  static List<charts.Series<LinearWalletPosition, int>> _populateData() {
    var myFakeMobileData = [
      LinearWalletPosition(0, 2),
      LinearWalletPosition(1, 5),
      LinearWalletPosition(2, 2),
      LinearWalletPosition(3, 8),
      LinearWalletPosition(4, 10),
      LinearWalletPosition(5, 30),
      LinearWalletPosition(6, 15),
      LinearWalletPosition(7, 40),
      LinearWalletPosition(8, 35),
      LinearWalletPosition(9, 75),
      LinearWalletPosition(10, 55),
      LinearWalletPosition(11, 60),
      LinearWalletPosition(12, 80),
      LinearWalletPosition(13, 85),
      LinearWalletPosition(14, 100),
      LinearWalletPosition(15, 150),
      LinearWalletPosition(16, 200),
      LinearWalletPosition(17, 175),
      LinearWalletPosition(18, 300),
      LinearWalletPosition(19, 225),
    ];

    return [
      new charts.Series<LinearWalletPosition, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearWalletPosition walletPosition, _) => walletPosition.time,
        measureFn: (LinearWalletPosition walletPosition, _) => walletPosition.position,
        data: myFakeMobileData,
      ),
    ];
  }
}