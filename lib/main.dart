import 'package:flutter/material.dart';
import 'package:quotes_app/pages/quote_detail.dart';
import 'package:quotes_app/pages/quote_list.dart';

import 'pages/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: QuoteList.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuoteList.routeName: (context) => QuoteList(),
        QuoteDetail.routeName: (context) => QuoteDetail(),
      },
    );
  }
}
