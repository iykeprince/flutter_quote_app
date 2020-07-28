import 'package:flutter/material.dart';

header(context, {String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        wordSpacing: -1,
      ),
    ),
    leading: IconButton(
      color: Colors.black,
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    actions: <Widget>[
      InkWell(
        onTap: () {},
        child: Icon(Icons.search, color: Colors.black,),
      ),
    ],
  );
}
