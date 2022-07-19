class ReviewsResponse {
  List<Reviews> reviews = [];
  String? count;

  ReviewsResponse({this.reviews = const [], this.count});

  ReviewsResponse.fromJson(Map<String, dynamic> json) {
    reviews = <Reviews>[];
    if (json['reviews'] != null) {
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Reviews {
  String? id;
  Message? message;
  String? type;
  String? shipperId;
  String? relatedSubject;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Reviews({
    this.id,
    this.message,
    this.type,
    this.shipperId,
    this.relatedSubject,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    type = json['type'];
    shipperId = json['shipper_id'];
    relatedSubject = json['related_subject'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.message != null) {
      data['message'] = this.message?.toJson();
    }
    data['type'] = this.type;
    data['shipper_id'] = this.shipperId;
    data['related_subject'] = this.relatedSubject;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Message {
  String? uz;
  String? ru;

  Message({this.uz, this.ru});

  Message.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uz'] = this.uz;
    data['ru'] = this.ru;
    return data;
  }
}
