import 'package:domain/model/cocktail/cocktail.dart';
import 'package:domain/model/handler/data_response.dart';
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
  Future<DataResponse<Iterable<Cocktail>>> fetchCocktails({
    bool readCache = true,
  }) async {
    if (readCache && _cocktails.isNotEmpty) {
      return DataResponse(data: _cocktails);
    }

    final result = await _requestHandler.safeApiCall(
      _cocktailsApiClient.fetchCocktails,
    );

    final response = result.toDataResponse(
      (data) => data.map((e) => e.toDomain()),
    );

    response.data?.let((cocktails) => _cocktails = cocktails);

    return response;
  }
}
