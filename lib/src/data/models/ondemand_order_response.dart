class OndemandOrderResponse {
  String? externalOrderId;
  String? orderId;
  String? paymentLink;

  OndemandOrderResponse({this.externalOrderId, this.orderId});

  OndemandOrderResponse.fromJson(Map<String, dynamic> json) {
    externalOrderId = json['external_order_id'];
    orderId = json['order_id'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['external_order_id'] = this.externalOrderId;
    data['order_id'] = this.orderId;
    return data;
  }
}
