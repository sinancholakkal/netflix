import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/search/search_resp/search_resp.dart';
import 'package:http/http.dart' as http;

ValueNotifier<List<SearchResultData>> searchResultNotifier = ValueNotifier([]);

Future<void>getSearchResult(String query)async{
  searchResultNotifier.value =[];
  final response = await http.get(Uri.parse("${ApiEndPoints.search}$query"));
  final Map<String,dynamic> bodyResponse =json.decode(response.body);
  final searchList = (bodyResponse["results"] as List).map((val){
    return SearchResultData.fromJson(val);
  });
  searchResultNotifier.value.addAll(searchList);
  searchResultNotifier.notifyListeners();
  print(searchResultNotifier.value.length);
  print("=================================");
}