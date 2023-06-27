import 'package:flutter/material.dart';
import 'package:news_c8_offline/data/api_manager.dart';
import 'package:news_c8_offline/data/repos/NewsRepo.dart';
import 'package:news_c8_offline/data/repos/data_sources/offline_data_source.dart';
import 'package:news_c8_offline/data/repos/data_sources/online_data_source.dart';
import 'package:news_c8_offline/model/source_response.dart';

class NewsTabViewModel extends ChangeNotifier{
  List<SourceDM> sources=[];
  int currentTabIndex = 0;
  String errorMsg = "";
  bool isLoading = false;
  OfflineDataSource offlineDataSource = OfflineDataSource();
  OnlineDataSource onlineDataSource = OnlineDataSource();

  late NewsRepo repo ;
  NewsTabViewModel(){
    repo = NewsRepo(offlineDataSource, onlineDataSource);
  }

  void getSources(String categoryId)async {
    isLoading = true;
    SourceResponseDM sourceResponseDM = await repo.getSources(categoryId);
    if(sourceResponseDM.code != null || sourceResponseDM.message != null){
      errorMsg = sourceResponseDM.message!;
      print("Error message: $errorMsg");
    }else {
      sources = sourceResponseDM.sources!;
      errorMsg = "";
    }
    isLoading = false;
    notifyListeners();
  }
}