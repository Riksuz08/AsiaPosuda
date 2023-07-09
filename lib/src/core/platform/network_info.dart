import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.internetConnectionCheckerPlus);

  final InternetConnectionChecker internetConnectionCheckerPlus;

  @override
  Future<bool> get isConnected => internetConnectionCheckerPlus.hasConnection;
}
