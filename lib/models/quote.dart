class Quote {
    Quote({
        this.text,
        this.author,
    });

    String text;
    String author;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        text: json["text"],
        author: json["author"] == null ? null : json["author"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "author": author == null ? null : author,
    };
}
