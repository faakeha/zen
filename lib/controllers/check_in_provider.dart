import 'package:flutter/cupertino.dart';

class CheckInProvider with ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  setSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}