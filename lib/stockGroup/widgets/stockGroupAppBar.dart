import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/stock.dart';

class StockGroupAppBar extends StatelessWidget implements PreferredSize {
  final Stock stock;

  const StockGroupAppBar({Key key, this.stock}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _getAppBarWidgets(context),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  _getAppBarWidgets(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildStockInfoFields(),
        _buildTradeButton(),
      ],
    );
  }

  _buildStockInfoFields() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(stock.name, style: TextStyles.blackBoldText,textScaleFactor: 0.8,),
                  Icon(Icons.info_outline, size: 18,)
                ],
              ),
              Text('${stock.members} members', style: TextStyles.greyText, textScaleFactor: 0.7,)
            ],
          ),
          Column(
            children: <Widget>[
              Text('\$${stock.stockValue}', style: TextStyles.blackBoldText, textScaleFactor: 0.8,),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon((stock.variation>0) ? Icons.arrow_upward : Icons.arrow_downward, color: (stock.variation>0) ? Colors.green : Colors.redAccent, size: 18,),
                    Text('${stock.variation}%', style: (stock.variation>0) ? TextStyles.greenText : TextStyles.redText, textScaleFactor: 0.8, )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );  
  }

  _buildTradeButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: FlatButton(
          onPressed: () {},
          child: Text('Trade', style: TextStyles.whiteText,),
          color: Colors.green,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight ?? 0.0);

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
