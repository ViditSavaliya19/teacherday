import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:teacherday/screens/userScreen/PostModel.dart';
import 'package:teacherday/screens/userScreen/ProductModel.dart';

class UserProvider extends ChangeNotifier {
  List jsonList = [];
  List<dynamic> productList = [];
  List<dynamic> filterList = [];
  List<PostModel> finalList = [];
  int i = 0;

  getUserData() async {
    // Json File on => Data Variable (String)
    String jsonFile = await rootBundle.loadString("assets/json/data.json");
    jsonList = jsonDecode(jsonFile);

    // Multi Data List
    finalList = jsonList.map((e) => PostModel().fromJson(e)).toList();

    notifyListeners();

    // Single Data
    // PostModel p1 = PostModel().fromJson(jsonList[0]);

    // print("${list[0].body} \n ${p1.body}");
  }

  getProduct() async {
    productList.clear();
    String data = await rootBundle.loadString("assets/json/product.json");
    var json = jsonDecode(data);

    productList = json.map((e) => ProductModel.fromJson(e)).toList();
    notifyListeners();
  }

  // Filter Price out of 10 ot 50

  void filterPrice() {
    for (i = 0; i < productList.length; i++) {
      if (productList[i].price! >= 10 && productList[i].price! <= 50) {
        filterList.add(productList[i]);
      }
    }

    productList = filterList;
    notifyListeners();

  }
}
