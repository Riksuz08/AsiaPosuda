class CouponModel {
  int id;
  String code;
  String amount;

  int usageLimit;

  CouponModel({
    required this.id,
    required this.code,
    required this.amount,
    required this.usageLimit,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json['id'],
        code: json['code'],
        amount: json['amount'],
        usageLimit: json['usage_limit'] != null ? json['usage_limit'] : -1,
      );
}
