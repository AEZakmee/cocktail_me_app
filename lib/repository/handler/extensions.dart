import '../../app/model/handler/data_response.dart';
import '../../app/model/handler/request_error.dart';
import '../../datasource/api/exceptions/bad_request_exception.dart';
import '../../datasource/api/exceptions/connection_exception.dart';
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
