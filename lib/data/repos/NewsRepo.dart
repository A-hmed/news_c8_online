import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c8_offline/data/repos/data_sources/offline_data_source.dart';
import 'package:news_c8_offline/data/repos/data_sources/online_data_source.dart';
import '../../model/source_response.dart';

class NewsRepo {
  OfflineDataSource offlineSource;
  OnlineDataSource onlineDataSource;
  NewsRepo(this.offlineSource, this.onlineDataSource);

  Future<SourceResponseDM> getSources(String sourceId) async{
    final connectivityResult = await (Connectivity().checkConnectivity());

    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi){
      var sourcesResponse = await onlineDataSource.getSources(sourceId);
      offlineSource.saveSources(sourceId ,sourcesResponse);
      return sourcesResponse;
    }
    else {
      var response = await offlineSource.getSources(sourceId)
          ?? SourceResponseDM(message: "Please make sure you good internet connection");
      return response;
    }
  }
}