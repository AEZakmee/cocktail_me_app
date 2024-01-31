class CocktailIngredient {
  CocktailIngredient({
    required this.id,
    required this.quantity,
  });

  CocktailIngredient.empty()
      : id = '',
        quantity = '';

  final String id;
  final String quantity;
}
