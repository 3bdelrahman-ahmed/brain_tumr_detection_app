class ContactUsRequestModel {
  final String message;

  ContactUsRequestModel({required this.message});

  Map<String, dynamic> toJson() {
    return {"message": message};
  }
}


class ContactUsResponseModel {
  final String message;

  ContactUsResponseModel({required this.message});

  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) {
    return ContactUsResponseModel(message: json['message'] ?? '');
  }
}
