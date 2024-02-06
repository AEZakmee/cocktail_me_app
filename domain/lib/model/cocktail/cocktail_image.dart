class CocktailImage {
  CocktailImage({
    required this.type,
    required this.url,
  });

  CocktailImage.empty()
      : type = '',
        url = '';

  final String type;
  final String url;
}
