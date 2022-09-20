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

  int? getErrorCode() => _errorCode;

  String getErrorMessage() => _errorMessage;

  _handleError(dynamic error) {
    _errorCode = error.response?.statusCode ?? 500;
    if (_errorCode == 500) {
      return _errorMessage = "Server error";
    }
    if (_errorCode == 502) {
      return _errorMessage = "Server down";
    }
    if (_errorCode == 404) {
      return _errorMessage = "Not Found";
    }
    if (_errorCode == 413) {
      return _errorMessage = "Request Entity Too Large";
    }
    if (_errorCode == 401) {
      return _errorMessage = "Token expired";
    }
    if (_errorCode == 403) {
      return _errorMessage = "Token expired";
    }
    switch (error.type) {
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.response:
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
      case DioErrorType.other:
        _errorMessage = "Something wrong";
        break;
    }
    return _errorMessage;
  }
}
