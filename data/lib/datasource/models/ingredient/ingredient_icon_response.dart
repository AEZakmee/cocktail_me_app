import 'package:json_annotation/json_annotation.dart';

enum IngredientIconResponse {
  @JsonValue('BOTTLE')
  bottle,
  @JsonValue('OTHER')
  other,
}
