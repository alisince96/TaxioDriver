class PhoneValiditityResponse {
  String status;
  Data data;

  PhoneValiditityResponse({this.status, this.data});

  PhoneValiditityResponse.fromJson(Map<String, dynamic> json) {
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
  String phone;
  bool isAvailable;

  Data({this.phone, this.isAvailable});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['is_available'] = this.isAvailable;
    return data;
  }
}
