// import 'package:sample_cubit_mobile/src/core/constants/constants.dart';
// import 'package:sample_cubit_mobile/src/data/source/local_source.dart';
// import 'package:web_socket_channel/io.dart';
//
// class WebSocketSource {
//   static IOWebSocketChannel? _webSocketChannel;
//
//   WebSocketSource._();
//
//   static WebSocketSource? localSource;
//
//   static WebSocketSource instance = WebSocketSource._();
//
//   static WebSocketSource getInstance({bool isConnect = false}) {
//     if(isConnect){
//       localSource = null;
//       _webSocketChannel = null;
//     }
//     if (localSource == null && _webSocketChannel == null) {
//       localSource = WebSocketSource._();
//       localSource!._init();
//     }
//     return localSource!;
//   }
//
//   _init() {
//     LocalSource _local = LocalSource.instance;
//     if (_local.getToken().isNotEmpty) {
//       _webSocketChannel = IOWebSocketChannel.connect(
//         '${Constants.webSocketUrl}?Authorization=${_local.getToken()}',
//       );
//     }
//     print('${Constants.webSocketUrl}?Authorization=${_local.getToken()}');
//   }
//
//   IOWebSocketChannel get channel => _webSocketChannel!;
// }
