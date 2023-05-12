import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/send_message_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/send_message_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) =>
      _ApiClient(dio, baseUrl: baseUrl);

  /// Check customer exits
  @POST('v2/send-message')
  Future<SendMessageResponse> sendMessage(
    @Body() SendMessageRequest request,
  );
}
