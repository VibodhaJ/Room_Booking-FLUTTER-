class AuthModel {
  String username;
  String password;
  String key;
  bool status;

  AuthModel({
    required this.username,
    required this.password,
    required this.key,
    required this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      username: json['username'],
      password: json['password'],
      key: json['key'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'key': key,
      'status': status,
    };
  }

  static void then(Null Function(dynamic authModel) param0) {}
}
