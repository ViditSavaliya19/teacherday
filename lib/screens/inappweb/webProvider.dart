import 'package:flutter/foundation.dart';

class WebProvider extends ChangeNotifier
{
   String url="https://www.google.com/";
   int progressWeb =0;

   void changeNewUrl(String link)
   {
      url=link;
      notifyListeners();
   }

   void newProgress(int progress)
   {
      progressWeb =progress;
      notifyListeners();
   }
}