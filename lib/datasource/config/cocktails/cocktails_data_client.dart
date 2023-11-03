import '../../../app/constants/remote_config_consts.dart';
import '../../models/cocktails_list_response.dart';
import '../remote_config.dart';

class CocktailsConfigClient {
  CocktailsConfigClient({required RemoteConfig config}) : _config = config;

  final RemoteConfig _config;

  CocktailsDataResponse getData() {
    final data = _config.getJson(RemoteConfigConsts.cocktails);
    return CocktailsDataResponse.fromJson(data);
  }
}
