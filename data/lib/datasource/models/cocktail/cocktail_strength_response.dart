import 'package:json_annotation/json_annotation.dart';

enum CocktailStrengthResponse {
  @JsonValue('LIGHT')
  light,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('STRONG')
  strong,
  @JsonValue('NONALCOHOLIC')
  nonalcoholic,
}
