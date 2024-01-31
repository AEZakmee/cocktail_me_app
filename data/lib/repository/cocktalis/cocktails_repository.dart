import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/repositories/cocktails_repository.dart';
import 'package:utils/let_extension.dart';

import '../../datasource/api/cocktails/cocktails_api_client.dart';
import '../handler/extensions.dart';
import '../handler/request_handler.dart';
import 'mappers/cocktails_mapper.dart';

class CocktailsRepositoryImpl implements CocktailsRepository {
  CocktailsRepositoryImpl({
    required CocktailsApiClient cocktailsApiClient,
    required RequestHandler requestHandler,
  })  : _cocktailsApiClient = cocktailsApiClient,
        _requestHandler = requestHandler;

  final CocktailsApiClient _cocktailsApiClient;
  final RequestHandler _requestHandler;

  Iterable<Cocktail> _cocktails = const [];

  @override
  Iterable<Cocktail> get cocktails => _cocktails;

  @override
  Future<bool> loadCocktails() async {
    final result = await _requestHandler.safeApiCall(
      _cocktailsApiClient.fetchCocktails,
    );

    return result
            .toDataResponse((data) => data.map((e) => e.toDomain()))
            .data
            ?.let((cocktails) {
          _cocktails = cocktails;
          return true;
        }) ??
        false;
  }
}
