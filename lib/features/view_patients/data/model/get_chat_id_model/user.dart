class User {
  String? id;
  String? fullName;
  String? userName;
  String? profilePicture;

  User({this.id, this.fullName, this.userName, this.profilePicture});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        userName: json['userName'] as String?,
        profilePicture: json['profilePicture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'userName': userName,
        'profilePicture': profilePicture,
      };
}
