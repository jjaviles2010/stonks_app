import 'package:flutter/material.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/stockGroup/widgets/stockGroupAppBar.dart';

class StockGroupScreen extends StatelessWidget {
  final Stock stock;

  const StockGroupScreen({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockGroupAppBar(stock: stock,),
      body: Container(),
    );
  }
}
