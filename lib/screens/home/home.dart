import 'package:flutter/material.dart';
import 'package:news_c8_offline/model/category_dm.dart';
import 'package:news_c8_offline/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_c8_offline/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_c8_offline/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM? selectedCategory = null;
  late Widget selectedTab ;

  @override
  void initState() {
    super.initState();
    selectedTab = CategoriesTab(setSelectedCategory);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(selectedTab == CategoriesTab(setSelectedCategory) || selectedTab == SettingsTab()){
          return Future.value(true);
        }else {
          selectedTab = CategoriesTab(setSelectedCategory);
          setState(() {});
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))
          ),
        ),
        body: selectedTab ,
          drawer: Drawer(
            child: buildDrawerWidget(),
          ),
      ),
    );
  }
  void setSelectedCategory(CategoryDM category){
    selectedCategory = category;
    selectedTab = NewsTab(selectedCategory!);
    setState(() {});
  }

  Widget buildDrawerWidget(){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * .18,
            child: Center(
              child: Text("News App!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
            ),
          ),
          SizedBox(height: 8,),
          InkWell(
              onTap: (){
                selectedCategory = null;
                selectedTab = CategoriesTab(setSelectedCategory);
                Navigator.pop(context);
                setState(() {});
              },
              child: buildDrawerRow(Icons.menu, "Categories")),
          SizedBox(height: 8,),
         InkWell(
             onTap: (){
               selectedTab = SettingsTab();
               Navigator.pop(context);
               setState(() {});
             },
             child: buildDrawerRow(Icons.settings, "Settings"))
        ],
      ),
    );
  }

  Widget buildDrawerRow(IconData icon, String text){
    return Row(
      children: [
        SizedBox(width: 8,),
        Icon(icon, size: 28, color: Colors.black,),
        SizedBox(width: 8,),
        Text(text, style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
