import 'package:json_annotation/json_annotation.dart';

part 'upcoming_movie_id.g.dart';

@JsonSerializable()
class UpcomingMovieId {
  String? id; // Keep this as String?

  UpcomingMovieId({this.id});

  factory UpcomingMovieId.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieId(
      id: json['id'] != null ? json['id'].toString() : null, // Convert int to String
    );
  }
}
