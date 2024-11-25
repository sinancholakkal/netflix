import 'package:json_annotation/json_annotation.dart';
part 'upcoming_video_key.g.dart';
@JsonSerializable()
class UpcomingVideoKey{
  String? key;
  
  String? name;

  
  UpcomingVideoKey({this.key});

  factory UpcomingVideoKey.fromJson(Map<String, dynamic> json) {
    return _$UpcomingVideoKeyFromJson(json);
  }
}