import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/widgets/customImage.dart';
import 'package:stonks_app/stockGroup/widgets/replayItem.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final bool showReactions;

  const PostItem({Key key, this.post, this.showReactions = false }) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool showReplayEditText = false;
  bool showReplayPosts = false;
  final replayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomImage(imageSrc: widget.post.userImg,),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(widget.post.userName, style: TextStyles.blackBoldText,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(widget.post.postTime, style: TextStyles.greyText, maxLines: 4,),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(widget.post.postText, overflow: TextOverflow.ellipsis, maxLines: 5,),
                ),
                (widget.showReactions == true) ? Wrap(
                  children: _buildReactionsFields(),
                ) : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildReactionsFields() {
    List<Widget> reactionsWidgets = [];

    reactionsWidgets.add(ButtonBar(
      alignment: MainAxisAlignment.start,
      buttonPadding: EdgeInsets.all(0),
      buttonHeight: 2,
      buttonMinWidth: 2,
      children: <Widget>[
        IconButton(icon: Icon(Icons.insert_emoticon), onPressed: () {}, color: Colors.grey,),
        IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {
          setState(() {
            if(showReplayPosts == false) {
              showReplayEditText = true;
              showReplayPosts = true;
            } else {
              showReplayEditText = false;
              showReplayPosts = false;
            }
          });
        }, color: Colors.grey,)
      ],
    ),);

    if(showReplayPosts == true) {
      reactionsWidgets.addAll(_buildRepliesFields());
    }

    if(showReplayEditText == true) {
      reactionsWidgets.add(_buildTextField());
    }

    return reactionsWidgets;
  }

  _buildTextField() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      color: Colors.grey[50],
      child: Row(children: <Widget>[
        Flexible(
            child: TextField(
              controller: replayController,
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
                    _includeReplay();
                    showReplayEditText = false;
                  });
                },),
              ),
            )
        ),
      ],),
    );
  }

  _includeReplay() {
    if(widget.post.replies == null) {
      widget.post.replies = [];
    }

    if(replayController.text.isNotEmpty) {
      widget.post.replies.add(_createNewReplay());
      replayController.text = "";
    }
  }

  Post _createNewReplay() {
    return
      Post('Ali', 'images/Mask.png', '4:30 PM', replayController.text, null, null, null);
  }

  _buildRepliesFields() {
    List<Widget> replies = [Container()];

    widget.post.replies?.forEach((replay) {
      replies.add(ReplayItem(reply: replay,));
    });

    return replies;
  }

}
