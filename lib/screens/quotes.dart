class Quote {
  String quotesText = '';
  Quote(this.quotesText);
  Quote._(this.quotesText);
}

List<Quote> getQuotes() {
  List<Quote> list = [
    Quote(
      "Why fit in when you were born to stand out?",
    ),
    Quote("Never blame anything on your adhd except for your success")
  ];
  return list;
}
