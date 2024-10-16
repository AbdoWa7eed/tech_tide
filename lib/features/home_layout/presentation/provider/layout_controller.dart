import 'package:flutter/material.dart';

class LayoutController extends ChangeNotifier {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  void setIndex(int index) {
    _currentIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  int get index => _currentIndex;
}
