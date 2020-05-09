import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  BottomMenuBar({Key key}) : super(key: key);

  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.restaurant),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/establishments');
              }),
          Container(
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.00, 3.00),
                  color: Color(0xff000000).withOpacity(0.16),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.restaurant_menu),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/plates');
              }),
        ],
      ),
    );
  }
}
