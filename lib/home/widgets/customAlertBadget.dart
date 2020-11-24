import 'package:flutter/material.dart';

class CustomAlertBadget extends StatelessWidget {
  final int alertNumber;

  const CustomAlertBadget({Key key, this.alertNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
          child: (alertNumber>0) ? Text(alertNumber.toString(), textAlign: TextAlign.center, textScaleFactor: 0.7, style: TextStyle(color: Colors.white),) : Container(),
        ));
  }
}
