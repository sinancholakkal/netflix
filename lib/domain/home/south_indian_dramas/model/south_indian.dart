import 'package:json_annotation/json_annotation.dart';


part 'south_indian.g.dart';

@JsonSerializable()
class SouthIndianDrama {
  @JsonKey(name: "poster_path")
  String? posterPath;

  SouthIndianDrama({this.posterPath});

  factory SouthIndianDrama.fromJson(Map<String, dynamic> json) {
    return _$SouthIndianDramaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SouthIndianDramaToJson(this);
}
