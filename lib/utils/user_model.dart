class User {
  final int? id; // For database use
  final String email;
  final String password;
  final String name;
  final String address;

  User(
      {this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'address': address,
    };
  }
}
