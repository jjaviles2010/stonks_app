import 'package:flutter/material.dart';
import 'package:stonks_app/config/style.dart';
import 'package:stonks_app/home/models/post.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class ReplayItem extends StatelessWidget {
  final Post reply;

  const ReplayItem({Key key, this.reply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 270,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomImage(imageSrc: reply.userImg,),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(reply.userName, style: TextStyles.blackBoldText,),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(reply.postTime, style: TextStyles.greyText, maxLines: 4,),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(reply.postText, overflow: TextOverflow.ellipsis, maxLines: 5,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

