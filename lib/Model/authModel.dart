class AuthModel {
  String? userId;
  String? email;
  String? name;
  String? profile;
  String? password;
  String? confirmPassword;

  AuthModel(
      {this.email,
      this.name,
      this.profile,
      this.password,
      this.confirmPassword,
      this.userId});

  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    name = json['Name'];
    profile = json['Profile'];
    password = json['Password'];
    confirmPassword = json['ConfirmPassword'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Name'] = name;
    data['Profile'] = profile;
    data['Password'] = password;
    data['ConfirmPassword'] = confirmPassword;
    data['UserId'] = userId;
    return data;
  }
}
