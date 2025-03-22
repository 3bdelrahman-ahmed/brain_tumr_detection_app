class LoginResponseModel{
  String? token;
  User? user;

  LoginResponseModel({this.token, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? profilePicture;
  String? fullName;
  String? userName;
  String? email;
  String? dateOfBirth;
  String? gender;
  double? latitude;
  double? longitude;
  int? age;

  User(
      {this.id,
      this.profilePicture,
      this.fullName,
      this.userName,
      this.email,
      this.dateOfBirth,
      this.gender,
      this.latitude,
      this.longitude,
      this.age});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilePicture = json['profilePicture'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profilePicture'] = this.profilePicture;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['age'] = this.age;
    return data;
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
