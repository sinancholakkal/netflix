import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/get_function/upcoming_id/upcoming_movie_id_function.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/model/upcoming_video_key/upcoming_video_key.dart';
import 'package:http/http.dart' as http;
ValueNotifier<List<UpcomingVideoKey>> upcomingVideoKeyNotifier = ValueNotifier([]);
Future<void>getUpcomingVideoKey()async{
  int i =0;
  for(var val in upcomingMovieIdNotifier.value){
    final response = await http.get(Uri.parse("$kBaseUrl/movie/${val.id}/videos?api_key=6eeedcb25b99190790c2b5158781352c#"));
    Map<String,dynamic> bodyResponse = json.decode(response.body);
    final keyResultList = (bodyResponse["results"] as List).map((e){
      return UpcomingVideoKey.fromJson(e);
    }); 
    upcomingVideoKeyNotifier.value.addAll(keyResultList);
    upcomingVideoKeyNotifier.notifyListeners();
    print("$videoBaseUrl${upcomingVideoKeyNotifier.value[i].name}");
    i++;
  }
  
  
}