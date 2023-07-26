import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String email;
  final String nickname;

  User(this.id, this.email, this.nickname);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
