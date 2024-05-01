class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Named constructor to create a User object from a JSON map
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
