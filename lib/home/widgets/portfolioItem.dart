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
        children: <Widget>[
          CustomImage(imageSrc: stock.logo,),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(stock.name, style: TextStyles.blackBoldText,),
                      ),
                      CustomAlertBadget(alertNumber: stock.unreadPosts,)
                    ],
                  )
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
