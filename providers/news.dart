import 'package:flutter/material.dart';
import 'package:nutritrack/api/const.dart';
import 'package:nutritrack/helpers/api.dart';
import 'package:nutritrack/models/TopNewsModel.dart';
import 'package:dio/dio.dart'; 
import 'package:nutritrack/fitur/home.dart';

class News with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNws;

  Future<void> getTopNews() async {
      // panggil api get news
      final Response res = await api(
        '${baseUrl}top-headlines?country=us&apiKey=$apiKey');
      
      if (res.statusCode == 200) {
        resNws = TopNewsModel.fromJson(res.data);
      } else {
        resNws = TopNewsModel();
      }
      isLoading = false;
      notifyListeners();
    }
}
