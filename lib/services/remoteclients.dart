// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:zartech/model/sample_model.dart';

// class RemoteServices {
//   static Future<Data?> fetchProducts() async {
//     var response = await get(Uri.parse(
//         'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;

//       return Data.fromJson();
//     } else {
//       //show error message
//       return null;
//     }
//   }
// }

// class Remoteservices {
//   List<Data> posttile = [];

//   Future<List<Data>?> getPost() async {
//     var response = await http.get(Uri.parse(
//         'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
//     var json = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       print("........................${response.body}");
//       for (Map i in json) {
//         posttile.add(Data.fromJson(json)) as Map<String, dynamic>;
//       }
//       return posttile;
//     } else {
//       return null;
//     }
//   }
// }
import 'package:dio/dio.dart';

class NewApiService {
  String url = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
  Dio _dio = Dio();
  // newApiServices() {
  //   _dio = Dio();
  // }
  final List<dynamic> responseDataList = [];
  List<dynamic> saladsAndSoupsList = [];
  List<dynamic> saladsAndSoupsListItems = [];

  Future<List<dynamic>?> getSaladsAndSoups() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        // responseDataList.add();÷
        saladsAndSoupsList = await response.data[0]["table_menu_list"][0]
            ["category_dishes"] as List;
        return saladsAndSoupsList;
      } else {
        throw DioError;
      }
    } on DioError {
      print('Error Occured');
    }
    return null;
  }

  // Future<List<TableMenuList>> fetchNewsArticle() async {
  //   try {
  //     Response response = await _dio.get(url);
  //     var data = TableMenuList.fromJson(response.data);
  //     return data.;
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }
}
