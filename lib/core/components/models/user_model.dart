abstract class User {
  final String id;
  final String name;
  final String email;
  final String image;
  final String? userName;
  final String token;
  final String location;

  User({
    required this.id,
    required this.userName,
    required this.name,
    required this.email,
    required this.image,
    required this.token,
    required this.location,
  });
}
