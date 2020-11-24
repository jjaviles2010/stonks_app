import 'package:flutter/material.dart';
import 'package:stonks_app/home/widgets/customImage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: _getAppBarWidgets(),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  _getAppBarWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            _getWelcomeMessage(),
            _getAccountBanlance(),
          ],
        ),
        _getProfileImage(),
      ],
    );
  }

  _getWelcomeMessage() {
    return Text('Welcome back Ali 👋',textScaleFactor: 0.7,);
  }

  _getAccountBanlance() {
    return Text('\$1,030,991.86');
  }

  _getProfileImage() {
     return CustomImage(imageSrc: 'images/Mask.png',);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight ?? 0.0);

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}
