import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/models/stock.dart';
import 'package:stonks_app/home/widgets/postItem.dart';
import 'package:stonks_app/stockGroup/widgets/stockGroupAppBar.dart';

class StockGroupScreen extends StatefulWidget {
  final Stock stock;

  const StockGroupScreen({Key key, this.stock}) : super(key: key);

  @override
  _StockGroupScreenState createState() => _StockGroupScreenState();
}

class _StockGroupScreenState extends State<StockGroupScreen> {
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockGroupAppBar(stock: widget.stock,),
      body: _buildPostsList(),
    );
  }

  _buildPostsList() {
    return Stack(
      children: [
        ListView(
          children: _populatePosts(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildTextField(),
        ),
      ],
    );
  }

  _populatePosts() {
    List<Widget> postWidgets = [];

    postWidgets.addAll(_getReadPosts());
    postWidgets.add(_buildDivider());
    postWidgets.addAll(_getUnreadPosts());
    postWidgets.add(SizedBox(height: 80,));
    
    return postWidgets;
  }

  _getReadPosts() {
    List<PostItem> postWidgets = [];

    widget.stock.posts.forEach((post) {
      if(post.unread == false) {
        postWidgets.add(PostItem(post: post,));
      }
    });

    return postWidgets;
  }

  _buildDivider() {
    return Stack(
      children: [
        Divider(
          color: Colors.redAccent,
          indent: 15,
          endIndent: 15,
        ),
        Center(
            child: Container(
              padding: EdgeInsets.only(left: 4, right: 4),
              color: Colors.grey[50],
                child: Text('Unread', style: TextStyles.redText,)
            )
        ),
      ],
    );
  }

  _getUnreadPosts() {
    List<PostItem> postWidgets = [];
    widget.stock.posts.forEach((post) {
      if(post.unread == true) {
        postWidgets.add(PostItem(post: post,));
      }
    });

    return postWidgets;
  }

  _buildTextField() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      color: Colors.grey[50],
      child: Row(children: <Widget>[
        Flexible(
            child: TextField(
              controller: postController,
              decoration: InputDecoration(
                hintText: 'Type a Message',
                helperText: '',
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                counterText: "",
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1.0, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(icon: Icon(Icons.send, color: Colors.grey,), onPressed: () {
                  setState(() {
                    _includePost();
                  });
                },),
              ),
            )
        ),
      ],),
    );
  }

  _includePost() {
    if(postController.text.isNotEmpty) {
      widget.stock.posts.add(_createNewPost());
      postController.text = "";
    }
  }

  Post _createNewPost() {
    return
      Post('Ali', 'images/Mask.png', '4:30 PM', postController.text, null, null, true);
  }
}
