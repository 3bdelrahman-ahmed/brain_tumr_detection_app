class ResetPasswordRequestModel {
  final String email;
  final String token;
  final String password;

  ResetPasswordRequestModel({
    required this.email,
    required this.token,
    required this.password,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
      'password': password,
    };
  }

  // Create from JSON
  // factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
  //   return ResetPasswordRequestModel(
  //     email: json['email'],
  //     token: json['token'],
  //     password: json['password'],
  //   );
  // }
}