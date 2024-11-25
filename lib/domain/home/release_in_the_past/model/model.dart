import 'package:json_annotation/json_annotation.dart';


part 'model.g.dart';

@JsonSerializable()
class ReleaseInThePastYear {
  @JsonKey(name: "poster_path")
  String? posterPath;

  ReleaseInThePastYear({this.posterPath});

  factory ReleaseInThePastYear.fromJson(Map<String, dynamic> json) {
    return _$ReleaseInThePastYearFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseInThePastYearToJson(this);
}
