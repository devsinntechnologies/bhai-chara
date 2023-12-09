class UserModel {
  String? email;
  String? name;
  String? password;
  String? uID;
  bool? isEmailVerified;
  bool? isPhoneVerified;

  UserModel(
      {this.email,
      this.name,
      this.password,
      this.uID,
      this.isEmailVerified,
      this.isPhoneVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    name = json['Name'];
    password = json['Password'];
    uID = json['UID'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Email'] = email;
    data['Name'] = name;
    data['Password'] = password;
    data['UID'] = uID;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    return data;
  }
}
