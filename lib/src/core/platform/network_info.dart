import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected;

  Stream<InternetStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.internetConnection);

  final InternetConnection internetConnection;

  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;

  @override
  Stream<InternetStatus> get onStatusChange =>
      internetConnection.onStatusChange;
}
