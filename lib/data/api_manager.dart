import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_c8_offline/model/articles_respone_dm.dart';
import '../model/source_response.dart';

abstract class ApiManager {
  static const baseUrl = "newsapi.org";
  static const apiKey = "a61d99660fb14713983dbdad1d16b96a";

  static Future <SourceResponseDM> getSources(String categoryId) async {
   try {
     Uri url = Uri.https(baseUrl, "v2/top-headlines/sources", {
       "apiKey": apiKey,
       "category": categoryId
     });
     Response myResponse = await get(url);
     Map json = jsonDecode(myResponse.body);
     print("SourceResponseDM: ${json}");
     SourceResponseDM sourceResponse = SourceResponseDM.fromJson(json);
     return sourceResponse;
   }on Exception catch (e){
      if(e.toString().contains("host")){
        return SourceResponseDM(message: "No internet connection please make sure you good network");
      }else {
        return SourceResponseDM(message: e.toString());

      }

   }
  }

  static Future<ArticlesResponseDM> getArticles(String sourceId) async {
    print("Calling v2/everything ");
    Uri url = Uri.https(baseUrl, "v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
    });
    Response response = await get(url);
    print("ArticlesResponseDM: ${response.body}");
    ArticlesResponseDM articlesResponseDM = ArticlesResponseDM.fromJson(jsonDecode(response.body));
    if(articlesResponseDM.code != null){
      throw Exception(articlesResponseDM.code);
    }
    return articlesResponseDM;
  }
}