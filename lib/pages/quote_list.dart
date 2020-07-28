import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/pages/quote_detail.dart';
import 'package:quotes_app/widgets/header.dart';

class QuoteList extends StatefulWidget {
  static const String routeName = '/quotes-list';
  QuoteList({Key key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  int _pageIndex = 0;
  PageController _pageController;
  List quoteList = [];
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 2,
      viewportFraction: 0.7,
    );
    getQuotes();
  }

  getQuotes() async {
    var response = await http.get('https://type.fit/api/quotes');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        quoteList = jsonResponse;
      });
    } else {
      print('Request failed with status code: ${response.statusCode}');
    }
  }

  get randomNumber {
    int min = 0;
    int max = colors.length - 1;
    Random random = new Random();
    int rand = min + random.nextInt(max - min);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    print('quote lenght: ${quoteList.length}');
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'QUOTES',
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.format_quote),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        itemCount: quoteList.length,
                        itemBuilder: (context, index) {
                          return _pageItem(context, index, quoteList[index]);
                        },
                        controller: _pageController,
                        scrollDirection: Axis.vertical),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Your Favorite',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: quoteList.length,
                        itemBuilder: (context, index) {
                          return _pageItem(
                              context, index, quoteList[index]);
                        },
                        controller: _pageController,
                        scrollDirection: Axis.vertical),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          ])),
    );
  }

  _pageItem(context, index, quote) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuoteDetail.routeName,
          arguments: quote,
        );
      },
      child: Card(
        elevation: 6,
        shadowColor: Colors.white,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${quote['text']}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 35,
                              height: 1,
                              color: Colors.black26,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              '${quote['author']}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(76),
                    ),
                  ),
                  child: Image.asset(
                    'images/avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
