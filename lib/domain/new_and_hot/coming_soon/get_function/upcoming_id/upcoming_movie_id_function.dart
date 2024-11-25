
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/model/upcoming_movie_id/upcoming_movie_id.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/infrastructure/api_key.dart';

ValueNotifier<List<UpcomingMovieId>> upcomingMovieIdNotifier = ValueNotifier([]);

Future<void> getUpcomingMovieId()async{
  final response = await http.get(Uri.parse("$upcomingMovieIdUrl$apiKey"));
  Map<String,dynamic> bodyResponse = json.decode(response.body);
  final upcomingMovieIdList = (bodyResponse["results"] as List).map((e){
    return UpcomingMovieId.fromJson(e);
  });
  upcomingMovieIdNotifier.value.addAll(upcomingMovieIdList);
  for(int i = 0; i<upcomingMovieIdNotifier.value.length;i++){
    print(upcomingMovieIdNotifier.value[i].id);
  }
  upcomingMovieIdNotifier.notifyListeners();
}