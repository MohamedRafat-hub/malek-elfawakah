class UserEntity {
  String name;
  final String email;
  final String uid;

  UserEntity({required this.name, required this.email, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
