class AppUser {
  final String id;
  final String name;
  final String email;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  // constructor to create an AppUser instance from a JSON map
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String, // Extract the id from the JSON map
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Method to convert an AppUser instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Convert id to JSON
      'name': name,
      'email': email,
    };
  }
}
