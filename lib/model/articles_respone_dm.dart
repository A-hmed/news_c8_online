import 'package:news_c8_offline/model/source_response.dart';

/// status : "ok"
/// totalResults : 2
/// articles : [{"source":{"id":"al-jazeera-english","name":"Al Jazeera English"},"author":"Al Jazeera","title":"Crypto giant Binance’s US arm suspends dollar deposits","description":"Move comes days after US regulators announced 13 civil charges against Binance and its CEO Changpeng Zhao.","url":"https://www.aljazeera.com/economy/2023/6/9/crypto-giant-binances-us-arm-suspends-dollar-deposits","urlToImage":"https://www.aljazeera.com/wp-content/uploads/2023/06/2023-06-05T180153Z_268004279_RC2QVS95YEIH_RTRMADP_3_USA-SEC-BINANCE-1-1686011497.jpg?resize=1920%2C1440","publishedAt":"2023-06-09T07:56:07Z","content":"Crypto exchange Binance.US has said it is suspending US dollar deposits and that its banking partners are preparing to pause fiat dollar withdrawal channels as early as June 13, just days after US re… [+2564 chars]"},{"source":{"id":"al-jazeera-english","name":"Al Jazeera English"},"author":"AJLabs","title":"Visualising Nvidia’s rise to the $1 trillion market value club","description":"Amid an AI boom, the US chipmaker has added more than $500bn in value since the start of 2023.","url":"https://www.aljazeera.com/economy/2023/6/1/visualising-nvidias-rise-to-the-1-trillion-market-value-club","urlToImage":"https://www.aljazeera.com/wp-content/uploads/2023/06/INTERACTIVE_NVIDIA_JUNE1_2023-1685624455.png?resize=1200%2C675","publishedAt":"2023-06-01T14:42:22Z","content":"Nvidia is joining the likes of Apple, Microsoft, Alphabet and Amazon with the company briefly reaching a $1 trillion market cap on Tuesday, making it one of only a handful of companies to do so.\r\nSha… [+2756 chars]"}]

class ArticlesResponseDM {
  String? status;
  int? totalResults;
  List<ArticleDM>? articles;
  String? code;
  String? message;

  ArticlesResponseDM({
      this.status, 
      this.totalResults, 
      this.articles, this.code, this.message});

  ArticlesResponseDM.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(ArticleDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"al-jazeera-english","name":"Al Jazeera English"}
/// author : "Al Jazeera"
/// title : "Crypto giant Binance’s US arm suspends dollar deposits"
/// description : "Move comes days after US regulators announced 13 civil charges against Binance and its CEO Changpeng Zhao."
/// url : "https://www.aljazeera.com/economy/2023/6/9/crypto-giant-binances-us-arm-suspends-dollar-deposits"
/// urlToImage : "https://www.aljazeera.com/wp-content/uploads/2023/06/2023-06-05T180153Z_268004279_RC2QVS95YEIH_RTRMADP_3_USA-SEC-BINANCE-1-1686011497.jpg?resize=1920%2C1440"
/// publishedAt : "2023-06-09T07:56:07Z"
/// content : "Crypto exchange Binance.US has said it is suspending US dollar deposits and that its banking partners are preparing to pause fiat dollar withdrawal channels as early as June 13, just days after US re… [+2564 chars]"

class ArticleDM {
  SourceDM? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleDM({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content});

  ArticleDM.fromJson(dynamic json) {
    source = json["source"] != null ? SourceDM.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

}