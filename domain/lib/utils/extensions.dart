import '../model/handler/data_response.dart';
import '../model/handler/request_error.dart';

extension DataResponseExtension<T> on DataResponse<T> {
  TResult? fold<TResult>({
    required TResult Function(T data) onSuccess,
    TResult Function(RequestError error)? onError,
  }) {
    if (data != null) {
      return onSuccess(data as T);
    }
    return onError?.call(error ?? GenericError());
  }

  DataResponse<T> mapData(T Function(T data) mapper) {
    return DataResponse<T>(
      data: data != null ? mapper(data as T) : null,
      error: error,
    );
  }
}
