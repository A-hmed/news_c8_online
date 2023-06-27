import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab? settingsTab;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  SettingsTab getInstance(){
    if(settingsTab == null){
      settingsTab = SettingsTab();
    }
    return settingsTab!;
  }
}
