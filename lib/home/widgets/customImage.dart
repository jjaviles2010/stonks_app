import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageSrc;

  const CustomImage({Key key, this.imageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageSrc)
              )
          )),
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
    );
  }
}
