import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c8_offline/screens/home/tabs/news_tab/NewsTabViewModel.dart';
import 'package:news_c8_offline/screens/home/tabs/news_tab/tab_content.dart';
import 'package:provider/provider.dart';

import '../../../../model/category_dm.dart';
import '../../../../model/source_response.dart';

class NewsTab extends StatefulWidget {
  CategoryDM selectedCategory;

  NewsTab(this.selectedCategory);

  @override
  State createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  NewsTabViewModel viewModel = NewsTabViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.selectedCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsTabViewModel, NewsViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is SucessState){
          return getScreenBody(viewModel.sources);
        }else if(state is ErrorState){
          return getErrorState(viewModel.errorMsg);
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget getErrorState(String message) {
    return Column(
      children: [
        Text(message),
        ElevatedButton(onPressed: (){
          viewModel.getSources(widget.selectedCategory.id);
        }, child: Text("Retry"))
      ],
    );
  }

  Widget getScreenBody(List<SourceDM> sources) {
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            TabBar(
              tabs: sources.map((source) {
                return getTab(source,
                    viewModel.currentTabIndex == sources.indexOf(source));
              }).toList(),
              onTap: (index) {
                viewModel.currentTabIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
            ),
            Expanded(
                child: TabBarView(
                    children: sources.map((source) {
              return TabContent(source);
            }).toList()))
          ],
        ));
  }

  Widget getTab(SourceDM source, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.blue, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        source.name ?? "unknown",
        style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
      ),
    );
  }
}
