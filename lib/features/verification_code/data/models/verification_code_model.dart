class VerificationCodeRequestModel {
  final String email;
  final String code;

  VerificationCodeRequestModel({required this.email, required this.code});

  factory VerificationCodeRequestModel.fromJson(Map<String, dynamic> json) => VerificationCodeRequestModel(
      email: json['email'] as String,
      code: json['code'] as String,
    );
  Map<String,dynamic>  toJson() => {
      'email': email,
      'token': code,
    };
}
