import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c8_offline/data/repos/NewsRepo.dart';
import 'package:news_c8_offline/data/repos/data_sources/offline_data_source.dart';
import 'package:news_c8_offline/data/repos/data_sources/online_data_source.dart';
import 'package:news_c8_offline/model/source_response.dart';

class NewsTabViewModel extends Cubit<NewsViewModelState> {
  List<SourceDM> sources=[];
  int currentTabIndex = 0;
  String errorMsg = "";
  bool isLoading = false;
  OfflineDataSource offlineDataSource = OfflineDataSource();
  OnlineDataSource onlineDataSource = OnlineDataSource();

  late NewsRepo repo ;
  NewsTabViewModel(): super(NewsViewModelState()){
    repo = NewsRepo(offlineDataSource, onlineDataSource);
  }

  void getSources(String categoryId)async {
    isLoading = true;
    emit(LoadingState());
    SourceResponseDM sourceResponseDM = await repo.getSources(categoryId);
    if(sourceResponseDM.code != null || sourceResponseDM.message != null){
      errorMsg = sourceResponseDM.message!;
      print("Error message: $errorMsg");
      emit(ErrorState());
    }else {
      sources = sourceResponseDM.sources!;
      errorMsg = "";
      emit(SucessState());
    }
    isLoading = false;
  }
 }

class NewsViewModelState{
}

class LoadingState extends NewsViewModelState{}
class SucessState extends NewsViewModelState{}
class ErrorState extends NewsViewModelState{}