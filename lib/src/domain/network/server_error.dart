import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withDioError({required DioError error}) {
    _handleError(error);
  }

  ServerError.withError({
    required String message,
    int? code,
  }) {
    _errorMessage = message;
    _errorCode = code;
  }

  int get errorCode => _errorCode ?? 0;

  String get message => _errorMessage;

  void _handleError(DioError error) {
    _errorCode = error.response?.statusCode ?? 500;
    if (_errorCode == 500) {
      _errorMessage = "Server error";
      return;
    }
    if (_errorCode == 502) {
      _errorMessage = "Server down";
      return;
    }
    if (_errorCode == 404) {
      _errorMessage = "Not Found";
      return;
    }
    if (_errorCode == 413) {
      _errorMessage = "Request Entity Too Large";
      return;
    }
    if (_errorCode == 401) {
      _errorMessage = "Token expired";
      return;
    }
    if (_errorCode == 403) {
      _errorMessage = "Token expired";
      return;
    }
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.badResponse:
        {
          if (error.response?.data['Error'] is Map<String, dynamic>) {
            _errorMessage = error.response!.data['Error']['message'].toString();
          } else {
            _errorMessage = error.response!.data['message'].toString();
          }
          break;
        }
      case DioErrorType.cancel:
        _errorMessage = "Canceled";
        break;
      case DioErrorType.unknown:
        _errorMessage = "Something wrong";
        break;
      case DioErrorType.badCertificate:
        _errorMessage = "Bad certificate";
        break;
      case DioErrorType.connectionError:
        _errorMessage = "Connection error";
        break;
    }
    return;
  }
}
