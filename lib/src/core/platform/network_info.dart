import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.internetConnection);

  final InternetConnectionChecker internetConnection;

  @override
  Future<bool> get isConnected => internetConnection.hasConnection;
}
