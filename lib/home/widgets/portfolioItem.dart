import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/customAlertBadget.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class PortfolioItem extends StatelessWidget {
  final Stock stock;

  const PortfolioItem({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomImage(imageSrc: stock.logo,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
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
                  SizedBox(width: 120,),
                  Container(
                    padding: EdgeInsets.only(right: 4.0),
                    decoration: new BoxDecoration(color: (stock.variation>=0) ? Colors.green : Colors.red[300], borderRadius: BorderRadius.circular(5),),
                    child: Row(
                      children: <Widget>[
                        Icon((stock.variation>0) ? Icons.arrow_upward : Icons.arrow_downward, color: Colors.white,),
                        Text('${stock.variation.abs()}%', style: TextStyles.whiteText,),
                      ],
                    ),
                  ),
                ],
              ),
              Text(stock.lastPost, style: (stock.unreadPosts > 0) ? TextStyles.blackBoldText : TextStyles.blackText,),
            ],
          )
        ],
      ),
    );
  }
}
