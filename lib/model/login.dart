class Login {
  String username;
  String password;

  Login({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password
  };

}
class LoginStatus {
   int success;
  String payload;

  LoginStatus({
    required this.success,
    required this.payload,
  });

  factory LoginStatus.fromJson(Map<String, dynamic> json) => LoginStatus(
    success: json["success"],
    payload: json["payload"],
  );
}
