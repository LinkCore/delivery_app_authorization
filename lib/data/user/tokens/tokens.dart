import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@JsonSerializable(explicitToJson: true)
class Tokens {
  final String accessToken;
  final String refreshToken;

  Tokens(this.accessToken, this.refreshToken);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}
