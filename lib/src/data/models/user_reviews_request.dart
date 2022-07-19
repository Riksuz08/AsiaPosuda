class UserReviewsRequest {
  String? branchId;
  String? branchName;
  String? clientId;
  String? clientName;
  String? clientPhone;
  String? courierId;
  String? courierName;
  String? id;
  String? lang;
  String? operatorId;
  String? operatorName;
  String? orderNum;
  String? relatedSubject;
  String? reviewId;
  String? reviewMessage;
  String? type;

  UserReviewsRequest({
    this.branchId,
    this.branchName,
    this.clientId,
    this.clientName,
    this.clientPhone,
    this.courierId,
    this.courierName,
    this.id,
    this.lang,
    this.operatorId,
    this.operatorName,
    this.orderNum,
    this.relatedSubject,
    this.reviewId,
    this.reviewMessage,
    this.type,
  });

  UserReviewsRequest.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    courierId = json['courier_id'];
    courierName = json['courier_name'];
    id = json['id'];
    lang = json['lang'];
    operatorId = json['operator_id'];
    operatorName = json['operator_name'];
    orderNum = json['order_num'];
    relatedSubject = json['related_subject'];
    reviewId = json['review_id'];
    reviewMessage = json['review_message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['courier_id'] = this.courierId;
    data['courier_name'] = this.courierName;
    data['id'] = this.id;
    data['lang'] = this.lang;
    data['operator_id'] = this.operatorId;
    data['operator_name'] = this.operatorName;
    data['order_num'] = this.orderNum;
    data['related_subject'] = this.relatedSubject;
    data['review_id'] = this.reviewId;
    data['review_message'] = this.reviewMessage;
    data['type'] = this.type;
    return data;
  }
}
