import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/header.dart';

class QuoteDetail extends StatefulWidget {
  static const String routeName = '/quote-detail';
  QuoteDetail({Key key}) : super(key: key);

  @override
  _QuoteDetailState createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> quote = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: header(context, title: 'Quote Detail'),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      child: Image.network(
                    'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg',
                    fit: BoxFit.fill,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      quote["author"],
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Center(
                      child: Text(
                        quote['text'],
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.account_balance),
                Icon(Icons.favorite),
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
