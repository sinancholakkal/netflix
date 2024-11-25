import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/download/models/downloads.dart';
import 'package:http/http.dart' as http;

ValueNotifier<List<Downloads>> downloadNotifier = ValueNotifier([]);
Future<void> getDownload() async {
  List<Downloads> values = [];
  final response = await http.get(Uri.parse(ApiEndPoints.downloads));
  Map<String, dynamic> bodyResponse = json.decode(response.body);
  final downloadList = (bodyResponse["results"] as List).map((e) {
    return Downloads.fromJson(e);
  });

  // for(int i = 0;i<=2;i++){
  //   values.add(Downloads.fromJson(resultsValue[i]));
  // }
  downloadNotifier.value.addAll(downloadList);
 // downloadNotifier.notifyListeners();
  print(downloadNotifier.value);
}
