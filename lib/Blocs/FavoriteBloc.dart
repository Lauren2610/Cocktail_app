import 'package:flutter/material.dart';

class FavoriteBloc extends ChangeNotifier {
  bool heartSelected = false;
  bool isDisposed = false;

  void heartOnTap(value) {
    heartSelected = value;
    safeChangeNotifier();
    print(heartSelected);
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
