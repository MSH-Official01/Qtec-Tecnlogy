import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/specialSearch.dart';


class SearchController extends GetxController {
  Future<Data?> getSearchProduct(
      String textToken, name) async {
    try {
      var url = "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice$name";
      // var url = Appurl.baseURL + "api/groceries/search";

      http.Response response = await http.get(Uri.parse(url));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final marketSearch = secialSearchFromJson(response.body);

        // print('proooooooooooooooooooo ${marketSearch.data}');
        // print(marketCategory.data[1].categoryName);s
        return marketSearch.data;
      } else {
        print('User not found');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class HomeController extends GetxController {
  var tokenGlobal;
  late int userId;

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? getTOken = prefs.getString('auth-token');
    print("token::::::::$getTOken");
    var token =getTOken!;
    return getTOken;
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user-id');
    print('User id from controller $userId');
    return userId;
  }
  
}