import 'package:json_annotation/json_annotation.dart';


part 'tense_drama_model.g.dart';

@JsonSerializable()
class TenseDramaModel {
  @JsonKey(name: "poster_path")
  String? posterPath;

  TenseDramaModel({this.posterPath});

  factory TenseDramaModel.fromJson(Map<String, dynamic> json) {
    return _$TenseDramaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TenseDramaModelToJson(this);
}
