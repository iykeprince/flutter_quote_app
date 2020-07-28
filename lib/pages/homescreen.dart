import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote_list.dart';
import 'package:quotes_app/widgets/header.dart';

import 'quote_list.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getQuoteCategories() async {
    // var response = await http.get('https://type.fit/api/quotes');
    // if (response.statusCode == 200) {
    //   var jsonResponse = json.decode(response.body);
    //   print('json responses: $jsonResponse');
    //   QuoteCategory quoteCategory = QuoteCategory.fromJson(jsonResponse);
    // } else {
    //   print('Request failed with status code: ${response.statusCode}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    getQuoteCategories();
    return Scaffold(
      appBar: header(context, title: "C A T E G O R Y"),
      body: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.only(
          top: 24,
          left: 12,
          right: 12,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            16,
            (index) => _gridItem(context, index),
          ),
        ),
      ),
    );
  }

  _gridItem(context, int index) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, QuoteList.routeName);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: index == 0
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 32,
              backgroundColor: Theme.of(context).accentColor,
              child: Text(
                'W',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Text(
              'Work & Success',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
