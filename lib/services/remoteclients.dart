import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewApiService {
  String url = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
  final Dio _dio = Dio();

  List<dynamic> saladsAndSoupsList = [];

  Future<List<dynamic>?> getSaladsAndSoups() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        saladsAndSoupsList = await response.data[0]["table_menu_list"][0]
            ["category_dishes"] as List;
        return saladsAndSoupsList;
      } else {
        throw DioError;
      }
    } on DioError {
      const Text('Error Occured');
    }
    return null;
  }
}
