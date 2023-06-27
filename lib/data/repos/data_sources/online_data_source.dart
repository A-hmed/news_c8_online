import 'package:news_c8_offline/data/api_manager.dart';
import 'package:news_c8_offline/model/source_response.dart';

class OnlineDataSource{
  Future<SourceResponseDM> getSources(String sourceId){
      return ApiManager.getSources(sourceId);
  }
}