import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomImage(imageSrc: post.userImg,),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(post.userName, style: TextStyles.blackBoldText,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(post.postTime, style: TextStyles.greyText, maxLines: 4,),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(post.postText, overflow: TextOverflow.ellipsis, maxLines: 5,),
                ),
                Wrap(
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      buttonPadding: EdgeInsets.all(0),
                      buttonHeight: 2,
                      buttonMinWidth: 2,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.insert_emoticon), onPressed: () {}, color: Colors.grey,),
                        IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}, color: Colors.grey,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
