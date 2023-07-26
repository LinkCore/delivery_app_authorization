import 'package:authorization/data/user/profile_data/user.dart';
import 'package:authorization/data/user/tokens/tokens.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final Tokens tokens;
  final User user;

  Profile(this.tokens, this.user);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
