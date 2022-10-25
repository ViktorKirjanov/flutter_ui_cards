class User {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;

  const User({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
    );
  }
}
