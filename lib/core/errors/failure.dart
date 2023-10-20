import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('connectionError');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic badResponse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(badResponse['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request Not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Unknow Error');
    }
  }
}
