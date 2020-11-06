class RegisterResponse {
  String status;
  Data data;

  RegisterResponse({this.status, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String authToken;
  int userId;
  bool isPhoneVerified;

  Data({this.authToken, this.userId, this.isPhoneVerified});

  Data.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    userId = json['user_id'];
    isPhoneVerified = json['is_phone_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['user_id'] = this.userId;
    data['is_phone_verified'] = this.isPhoneVerified;
    return data;
  }
}
