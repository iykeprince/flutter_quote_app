import 'quote.dart';

class QuoteList {
  List<Quote> quotes;

  QuoteList({this.quotes});

  factory QuoteList.fromJson(Map<String, dynamic> json) => QuoteList(
        quotes: List<Quote>.from(json[''].map((x) => Quote.fromJson(x))),
    );

}
