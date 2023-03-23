import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:test_demo/API_RiverPod/Model_data.dart';

List<UserData> parseUserDatas(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<UserData> Users =list.map((e) => UserData.fromJson(e)).toList();
  return Users;
}

Future<List<UserData>> fetchUserDatas()async{
  final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if(response.statusCode==200){
    return compute(parseUserDatas,response.body);
  }else{
    throw Exception('Error USER DATA');
  }
}