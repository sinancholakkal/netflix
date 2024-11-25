import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey&query=";
  static const homeReleaseInPast = "$kBaseUrl/movie/now_playing?language=ml-US&page=1&api_key=$apiKey";
  static const homeTvShow = "$kBaseUrl/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&&api_key=$apiKey";
  static const homeTenseDramas = "$kBaseUrl/movie/top_rated?language=en-US&page=1&api_key=$apiKey";
  static const homeSouthIndianMovie = "$kBaseUrl/movie/now_playing?language=en-US&page=1&api_key=$apiKey";
}
