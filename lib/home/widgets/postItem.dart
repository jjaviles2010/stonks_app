import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CustomImage(imageSrc: post.userImg,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(post.userName, style: TextStyles.blackBoldText,),
                  Text(post.postTime, style: TextStyles.greyText, maxLines: 4,)
                ],
              ),
              Text(post.postText, style: TextStyles.blackText,),
            ],
          ),
        ],
      ),
    );
  }
}
