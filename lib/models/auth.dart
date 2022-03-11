class AuthModel {
  String userid;
  String password;
  AuthModel({
    required this.userid,
    required this.password,
  });

  factory AuthModel.fromJson(Map json) {
    return AuthModel(
      userid: json['userid'],
      password: json['password'],
    );
  }
}
