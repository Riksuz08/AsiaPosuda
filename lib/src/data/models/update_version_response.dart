class UpdateVersionResponse {
  String? appName;
  String? iosVersion;
  String? androidVersion;
  bool? isForce;

  UpdateVersionResponse({
    this.appName,
    this.iosVersion,
    this.androidVersion,
    this.isForce,
  });

  UpdateVersionResponse.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    iosVersion = json['ios_version'];
    androidVersion = json['android_version'];
    isForce = json['is_force'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['ios_version'] = this.iosVersion;
    data['android_version'] = this.androidVersion;
    data['is_force'] = this.isForce;
    return data;
  }
}
