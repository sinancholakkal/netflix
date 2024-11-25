import 'package:json_annotation/json_annotation.dart';


part 'model.g.dart';

@JsonSerializable()
class TopTvShow {
  @JsonKey(name: "poster_path")
  String? posterPath;

  TopTvShow({this.posterPath});

  factory TopTvShow.fromJson(Map<String, dynamic> json) {
    return _$TopTvShowFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopTvShowToJson(this);
}
