import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/home/release_in_the_past/model/model.dart';
import 'package:http/http.dart' as http;

ValueNotifier<List<ReleaseInThePastYear>> releaseInThePastYearNotifier = ValueNotifier([]);

Future<void> getReleaseInThePastYear()async{
  final response = await http.get(Uri.parse(ApiEndPoints.homeReleaseInPast));
  Map<String,dynamic> bodyResponse = jsonDecode(response.body);
  final finalResultList = (bodyResponse['results'] as List).map((e){
    return ReleaseInThePastYear.fromJson(e);
  });
  releaseInThePastYearNotifier.value.addAll(finalResultList);
  print(releaseInThePastYearNotifier.value[0].posterPath);
  print("=====================================================");
  releaseInThePastYearNotifier.notifyListeners();
}