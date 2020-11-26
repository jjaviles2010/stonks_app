import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/models/reaction.dart';
import 'package:stonks_app/home/widgets/customImage.dart';
import 'package:stonks_app/stockGroup/widgets/replayItem.dart';
import 'package:emoji_picker/emoji_picker.dart';

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
  bool showEmojiPicker = false;
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
      children: _buildButtons(),
    ),);


    if(showEmojiPicker == true) {
      reactionsWidgets.add(_buildEmojiPickerWidget());
    }

    if(showReplayPosts == true) {
      reactionsWidgets.addAll(_buildRepliesFields());
    }

    if(showReplayEditText == true) {
      reactionsWidgets.add(_buildTextField());
    }

    return reactionsWidgets;
  }

  _buildButtons() {
    List<Widget> buttons = [];

    widget.post.reactions?.forEach((reaction) {
      buttons.add(
        FlatButton(
          padding: EdgeInsets.only(right: 8, left: 5, top: 5, bottom: 5, ),
          child: Row(
            children: <Widget>[
              Text(reaction.emoji, textScaleFactor: 0.9),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(reaction.reactionTimes.toString(), textScaleFactor: 0.9),
              ),
            ],
          ),
          color: Colors.grey[300],
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            setState(() {
              _includeReaction(reaction.emoji, reaction.name);
            });
          },
        ),
      );

    });

    buttons.add(
      IconButton(icon: Icon(Icons.insert_emoticon), onPressed: () {
        setState(() {
          showEmojiPicker = !showEmojiPicker;
        });
      }, color: Colors.grey,),
    );

    buttons.add(
        IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {
          setState(() {
            showReplayEditText = !showReplayEditText;
            showReplayPosts = !showReplayPosts;
          });
        }, color: Colors.grey,)
    );

    return buttons;
  }

  _buildEmojiPickerWidget() {
      return EmojiPicker(
        rows: 3,
        columns: 6,
        buttonMode: ButtonMode.MATERIAL,
        recommendKeywords: ["face", "money", 'drink', 'celebration'],
        numRecommended: 10,
        onEmojiSelected: (reaction, category) {
          setState(() {
            _includeReaction(reaction.emoji, reaction.name);
            showEmojiPicker = false;
          });
        },
      );
  }

  _includeReaction(emoji, name) {
    if(widget.post.reactions == null)
      widget.post.reactions = [];

    if(widget.post.reactions.any((reaction) => reaction.emoji == emoji)) {
      widget.post.reactions.forEach((reaction) {
        if (reaction.emoji == emoji) {
          reaction.reactionTimes += 1;
        }
      });
    } else {
      widget.post.reactions.add(Reaction(name, emoji, 1));
    }
  }

  _buildRepliesFields() {
    List<Widget> replies = [Container()];

    widget.post.replies?.forEach((replay) {
      replies.add(ReplayItem(reply: replay,));
    });

    return replies;
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

}
