import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 14,
                      width: 14,
                      decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text('8', textAlign: TextAlign.center, textScaleFactor: 0.7, style: TextStyle(color: Colors.white),),
                    ))
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
