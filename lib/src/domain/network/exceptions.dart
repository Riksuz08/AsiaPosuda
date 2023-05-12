class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  factory ServerException.fromJson(Map<String, dynamic> json) {
    return ServerException(message: json['data']);
  }
}

class NoInternetException implements Exception {}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() {
    return message;
  }
}
