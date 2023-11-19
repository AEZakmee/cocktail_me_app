enum CocktailsApiType {
  local(id: 0),
  config(id: 1);

  const CocktailsApiType({required this.id});

  static CocktailsApiType getType(int id) {
    return switch (id) {
      0 => CocktailsApiType.local,
      1 => CocktailsApiType.config,
      int() => CocktailsApiType.local,
    };
  }

  final int id;
}
