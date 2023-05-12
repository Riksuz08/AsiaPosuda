class SendMessageResponse {
  final String? status;
  final String? description;
  final Map<String, dynamic>? data;

  SendMessageResponse({
    this.status,
    this.description,
    this.data,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      status: json['message'],
      description: json['error'],
      data: json['data'],
    );
  }
}
