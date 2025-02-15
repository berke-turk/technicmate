class UserRequestModel {
  String? email;
  String? password;

  UserRequestModel({this.email, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['encrypted_password'] = this.password;
    return data;
  }

  Map<String, dynamic> toCheckEmailJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}
