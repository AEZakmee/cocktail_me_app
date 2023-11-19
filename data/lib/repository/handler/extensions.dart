import 'package:core/model/handler/data_response.dart';
import 'package:core/model/handler/request_error.dart';

import 'network_result.dart';

extension NetworkResultExtensions<U> on NetworkResult<U> {
  DataResponse<T> toDataResponse<T>(T Function(U) mapper) {
    return switch (this) {
      SuccessResult<U>() => DataResponse(
          data: mapper((this as SuccessResult<U>).data),
        ),
      ErrorResult<U>() => DataResponse(
          error: (this as ErrorResult<U>).exception.toRequestError(),
        ),
    };
  }
}

extension ExceptionToDomainExtension on Exception {
  RequestError toRequestError() {
    return GenericError();
  }
}
