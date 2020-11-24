import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class PortfolioItem extends StatelessWidget {
  final Stock stock;

  const PortfolioItem({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CustomImage(imageSrc: stock.logo,),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(stock.name, style: TextStyles.blackBoldText,)
                ],
              ),
              Text(stock.lastPost, style: TextStyles.blackBoldText,),
            ],
          )
        ],
      ),
    );
  }
}
