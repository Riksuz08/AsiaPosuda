class ProductReview {
  final int id;
  final DateTime createdAt;
  final String review;
  final int rating;
  final String reviewerName;
  final String reviewerEmail;
  final bool verified;

  ProductReview({
    required this.id,
    required this.createdAt,
    required this.review,
    required this.rating,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.verified,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      review: json['review'],
      rating: int.parse(json['rating']),
      reviewerName: json['reviewer_name'],
      reviewerEmail: json['reviewer_email'],
      verified: json['verified'],
    );
  }
}
