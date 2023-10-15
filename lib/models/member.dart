class Member {
  Member({
    required this.id,
    required this.email,
    required this.name,
  });

  Member.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        name = json["name"];

  final int id;
  final String email;
  final String name;
}
