import 'package:flutter/material.dart';
import 'package:stonks_app/home/widgets/customAlertBadget.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('HOME'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text('CHATS'),
        ),
        BottomNavigationBarItem(
          icon: Stack(
              children: <Widget>[
                Icon(Icons.alternate_email),
                CustomAlertBadget(alertNumber: 8,)
              ]
          ),
          title: Text('MENTIONS'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('BROWSE'),
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
