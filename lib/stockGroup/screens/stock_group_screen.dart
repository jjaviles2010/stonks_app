import 'package:flutter/material.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/postItem.dart';
import 'package:stonks_app/stockGroup/widgets/stockGroupAppBar.dart';

class StockGroupScreen extends StatelessWidget {
  final Stock stock;

  const StockGroupScreen({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockGroupAppBar(stock: stock,),
      body: _buildPostsList(),
    );
  }

  _buildPostsList() {
    return Container(
      child: ListView(
        children: _populatePosts(),
      ),
    );
  }

  _populatePosts() {
    List<Widget> postWidgets = [];

    postWidgets.addAll(_getReadPosts());
    postWidgets.add(_buildDivider());
    postWidgets.addAll(_getUnreadPosts());

    return postWidgets;
  }

  _getReadPosts() {
    List<PostItem> postWidgets = [];

    stock.posts.forEach((post) {
      if(post.unread == false) {
        postWidgets.add(PostItem(post: post,));
      }
    });

    return postWidgets;
  }

  _buildDivider() {
    return Divider(
      color: Colors.redAccent,
    );
  }

  _getUnreadPosts() {
    List<PostItem> postWidgets = [];
    stock.posts.forEach((post) {
      if(post.unread == true) {
        postWidgets.add(PostItem(post: post,));
      }
    });

    return postWidgets;
  }
}
