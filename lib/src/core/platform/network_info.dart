import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionCheckerPlus;

  NetworkInfoImpl(this.internetConnectionCheckerPlus);

  @override
  Future<bool> get isConnected => internetConnectionCheckerPlus.hasConnection;
}
