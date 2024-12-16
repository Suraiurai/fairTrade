import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  int? albumId; 
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  User({
    required this.albumId, this.id, required this.title, required this.url, required this.thumbnailUrl
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



