import 'package:flutter/material.dart';
import 'package:news_c8_offline/model/source_response.dart';

import '../../../../data/api_manager.dart';
import '../../../../model/articles_respone_dm.dart';

class TabContent extends StatelessWidget {
  SourceDM sourceDM;
  TabContent(this.sourceDM) ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponseDM>(
        future: ApiManager.getArticles(sourceDM.id!),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
            itemBuilder:  (context, index){
                return buildNewsWidget(context,snapshot.data!.articles![index]);
            });
          }else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
  Widget buildNewsWidget(BuildContext context,ArticleDM article){
      return Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(fit: BoxFit.fill,height: MediaQuery.of(context).size.height * .25,article.urlToImage??"https://www.cimspa.co.uk/globalassets/images-cimspa/news-images/_news-placeholder-salmon-navy-1920.png?w=1410")),
              ],
            ),
            SizedBox(height: 4,),
            Text(article.author??"",textAlign: TextAlign.start ,style: TextStyle(color: Colors.grey[500], fontSize: 12),),
            SizedBox(height: 8,),
            Text(article.title??"", textAlign: TextAlign.start ,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                fontSize: 15)),
            SizedBox(height: 4,),
            Text(article.publishedAt??"",textAlign: TextAlign.end ,style: TextStyle(color: Colors.grey[500], fontSize: 12)),
          ],
        ),
      );


  }
}
