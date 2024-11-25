import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/domain/home/top_tv_show/model/model.dart';

ValueNotifier<List<TopTvShow>> topTvShowsNotifier = ValueNotifier([]);

Future<void> getTopTvShow()async{
  final response = await http.get(Uri.parse(ApiEndPoints.homeTvShow));
  Map<String,dynamic> bodyResponse = jsonDecode(response.body);
  final finalResultList = (bodyResponse['results'] as List).map((e){
    return TopTvShow.fromJson(e);
  });
  topTvShowsNotifier.value.addAll(finalResultList);
  topTvShowsNotifier.notifyListeners();
}