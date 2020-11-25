import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/customAlertBadget.dart';
import 'package:stonks_app/home/widgets/customImage.dart';
import 'package:stonks_app/stockGroup/screens/stock_group_screen.dart';

class PortfolioItem extends StatelessWidget {
  final Stock stock;

  const PortfolioItem({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StockGroupScreen(stock: stock)));
      },
      child: Container(
        padding: EdgeInsets.all(7.0),
        width: 330,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomImage(imageSrc: stock.logo,),
            Container(
              width: 275,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(stock.name, style: TextStyles.blackBoldText,),
                            ),
                            CustomAlertBadget(alertNumber: stock.unreadPosts,)
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 5.0, left: 5.0),
                          decoration: new BoxDecoration(color: (stock.variation>=0) ? Colors.green : Colors.red[300], borderRadius: BorderRadius.circular(5),),
                          child: Row(
                            children: <Widget>[
                              Icon((stock.variation>0) ? Icons.arrow_upward : Icons.arrow_downward, color: Colors.white, size: 12,),
                              Text('${stock.variation.abs()}%', style: TextStyles.whiteText,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(stock.lastPost, style: (stock.unreadPosts > 0) ? TextStyles.blackBoldText : TextStyles.blackText,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
