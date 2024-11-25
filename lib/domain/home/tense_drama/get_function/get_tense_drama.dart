import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/domain/home/tense_drama/model/tense_drama_model.dart';

ValueNotifier<List<TenseDramaModel>> tenseDramaNotifier = ValueNotifier([]);

Future<void> getTenseDrama()async{
  final response = await http.get(Uri.parse(ApiEndPoints.homeTenseDramas));
  Map<String,dynamic> bodyResponse = jsonDecode(response.body);
  final finalResultList = (bodyResponse['results'] as List).map((e){
    return TenseDramaModel.fromJson(e);
  });
  tenseDramaNotifier.value.addAll(finalResultList);
  tenseDramaNotifier.notifyListeners();
}