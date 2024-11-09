import 'package:flutter/cupertino.dart';

class OnBordingNotifier with ChangeNotifier{
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set setSelectedPage(int page){
    _selectedPage = page;
    notifyListeners();
  }
}