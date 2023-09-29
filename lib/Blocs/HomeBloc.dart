import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBloc extends ChangeNotifier {
  int selectedIndex = 0;
  bool isDisposed = false;

  PageController pageController = PageController(initialPage: 0);

  void changeIndex(value) {
    selectedIndex = value;
    safeChangeNotifier();
  }

  void safeChangeNotifier() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
