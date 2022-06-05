import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_with_flutter/model/user.dart';
import 'package:http/http.dart' as http;
import '../utils/app_credentials.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {

  User? userList;
  var isDataLoading = false.obs;

  getUserInfoFromAPI() async {

    try{
      isDataLoading(true);

      http.Response response = await http
          .get(Uri.tryParse('$baseUrl/user')!, headers: {
        'app-id': apiKey,
      });

      if(response.statusCode == 200){
        var result = jsonDecode(response.body);

        userList = User.fromJson(result);

        isDataLoading(false);
      }
      else{
        isDataLoading(false);
      }
    }
    catch(e){
      isDataLoading(false);
      debugPrint('Error: $e');
    }
    finally{
      isDataLoading(false);
    }
  }
}
