import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/domain/home/south_indian_dramas/model/south_indian.dart';
import 'package:netflix/domain/home/tense_drama/model/tense_drama_model.dart';

ValueNotifier<List<SouthIndianDrama>> southIndianDramaNotifier = ValueNotifier([]);

Future<void> getSouthIndianDrama()async{
  final response = await http.get(Uri.parse(ApiEndPoints.homeSouthIndianMovie));
  Map<String,dynamic> bodyResponse = jsonDecode(response.body);
  final finalResultList = (bodyResponse['results'] as List).map((e){
    return SouthIndianDrama.fromJson(e);
  });
  southIndianDramaNotifier.value.addAll(finalResultList);
  southIndianDramaNotifier.notifyListeners();
}