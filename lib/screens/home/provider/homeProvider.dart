import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isPlay = false;
  Duration endDuration = Duration(seconds: 0);


  void getDuration(Duration d1)
  {
    endDuration =d1;
    notifyListeners();
  }

  void changeState() {
    isPlay = !isPlay;
    notifyListeners();
  }
}
