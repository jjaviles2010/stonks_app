import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/customAppBar.dart';
import 'package:stonks_app/home/widgets/customBottomNavBar.dart';
import 'package:stonks_app/home/widgets/portfolioItem.dart';
import 'package:stonks_app/home/widgets/postItem.dart';
import 'package:stonks_app/home/widgets/stackedChart.dart';

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
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _walletPosition(),
          _buildChart(),
          _buyingPower(),
          _buildPortfolioHeader(),
          _getPortofolio(),
          _buildTopPostHeader(),
          _getTopPosts(),
        ],
      ),
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

  _buildChart() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
              height: 250,
              child: StackedChart()
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonPadding: EdgeInsets.only(left: 2, right: 2),
            buttonHeight: 4,
            buttonMinWidth: 4,
            children: <Widget>[
              FlatButton(
                child: Text('1D', textScaleFactor: 0.9,),
                color: Colors.green,
                onPressed: () { },
              ),
              FlatButton(
                child: Text('1W', textScaleFactor: 0.9, style: TextStyles.greenText,),
                color: Colors.white,
                onPressed: () { },
              ),
              FlatButton(
                child: Text('1M', textScaleFactor: 0.9, style: TextStyles.greenText),
                color: Colors.white,
                onPressed: () { },
              ),
              FlatButton(
                child: Text('3M', textScaleFactor: 0.9, style: TextStyles.greenText),
                color: Colors.white,
                onPressed: () { },
              ),
              FlatButton(
                child: Text('1Y', textScaleFactor: 0.9, style: TextStyles.greenText),
                color: Colors.white,
                onPressed: () { },
              ),
              FlatButton(
                child: Text('ALL', textScaleFactor: 0.9, style: TextStyles.greenText),
                color: Colors.white,
                onPressed: () { },
              ),
            ],
          )
        ],
      ),
    );
  }

  _buyingPower() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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

  _buildPortfolioHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Text('Portfolio', style: TextStyles.blackBoldText,),
      ),
    );
  }

  Column _getPortofolio() {
    List<Stock> stocksGroup = _populateStocks();
    List<Widget> portfolioItem = [];

    stocksGroup.forEach((stock) {
      portfolioItem.add(PortfolioItem(stock: stock,));
    });

    return Column(children: portfolioItem,);
  }

  List<Stock> _populateStocks() {
    return [
      Stock('PayPal', 'images/paypal.png', 'Brooklyn Simmons: Just confirming that...', 3.6, 5, 243.66, 18923, null),
      Stock('Twitter', 'images/twitter.png', 'Dianne Russell: Sell my October 1400 an...', -1.4, 3, 567.73, 20754, null),
      Stock('Testla', 'images/tesla.png', 'Ronald Richards: Tesla Accusses Rivian of...', -1.4, 0, 567.73, 20754, null),
      Stock('Facebook', 'images/facebook.png', 'Albert Flores: Wow, after listening to the...', -1.4, 0, 567.73, 20754, null),
    ];
  }

  _buildTopPostHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Text('Top Posts', style: TextStyles.blackBoldText,),
      ),
    );
  }

  Column _getTopPosts() {
    List<Post> topPosts = _populateTopPosts();
    List<Widget> postItems = [];

    topPosts.forEach((post) {
      postItems.add(PostItem(post: post,));
    });

    return Column(children: postItems,);
  }

  List<Post> _populateTopPosts() {
    return [
      Post('Arlene McCoy', '2:18 PM', 'Tech stocks up 5% holy\n moly *&^*&^*&^. What a\n time to be alive. '
          'Who cares\n if its a bubble? Ride and roll\n baby!👍👍👍', null, null, null)
    ];
  }
}
