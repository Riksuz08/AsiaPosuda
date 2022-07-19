class UserUpdateReviewsRequest {
  bool? seen;
  String? userId;

  UserUpdateReviewsRequest({this.seen, this.userId});

  UserUpdateReviewsRequest.fromJson(Map<String, dynamic> json) {
    seen = json['seen'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seen'] = this.seen;
    data['user_id'] = this.userId;
    return data;
  }
}