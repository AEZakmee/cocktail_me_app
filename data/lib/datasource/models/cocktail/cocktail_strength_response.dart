import 'package:json_annotation/json_annotation.dart';

enum CocktailStrengthResponse {
  @JsonValue('LIGHT')
  light,
  @JsonValue('MODERATE')
  moderate,
  @JsonValue('STRONG')
  strong,
  @JsonValue('NONALCOHOLIC')
  nonalcoholic,
}
