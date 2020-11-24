import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/widgets/customAppBar.dart';
import 'package:stonks_app/home/widgets/customBottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: getHomeData(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  getHomeData() {
    return ListView(
      children: <Widget>[
        _walletPosition(),
        // _graphData(),
        _buyingPower(),
        _getPortofolio(),
      ],
    );
  }

  _walletPosition() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0, right: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('TODAY', style: TextStyles.greyText,),
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_upward, color: Colors.green,),
                  Text('2.62%', style: TextStyles.greenText, )
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text('TOTAL %', style: TextStyles.greyText,),
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_upward, color: Colors.green,),
                  Text('32.14%', style: TextStyles.greenText, )
                ],
              )
            ],
          ),Column(
            children: <Widget>[
              Text('TOTAL \$', style: TextStyles.greyText,),
              Text('\$330,961%', style: TextStyles.blackBoldText, )
            ],
          )
        ],
      ),
    );
  }

  _buyingPower() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Buying Power', style: TextStyles.blackText,),
          Row(
            children: <Widget>[
              Text('\$300.03', style: TextStyles.blackText,),
              Icon(Icons.keyboard_arrow_right),
            ],
          )
        ],
      ),
    );
  }

  _getPortofolio() {

  }
}
