import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioExcepion(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout with Api Server.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout with Api Server.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout with Api Server.");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with Api Server.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Requet to Api Server was cancelled.");
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure("No internet connection.");
        } else if (dioException.error is SocketException) {
          return ServerFailure("No internet connection.");
        }
        return ServerFailure("Something went wrong. Please, try again later.");
      case DioExceptionType.unknown:
        return ServerFailure("Unexcpected error! Please, try again later.");

      default:
        return ServerFailure(
            "Opps, Something went wrong. Please, try again later.");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Requst not Found. Please, try again.");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error. Please, try again later.");
    } else {
      return ServerFailure("Something went wrong. Please, try again later.");
    }
  }
}
