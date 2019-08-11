class User {
  String id;
  String name;
  String email;
  String avatar;
  String socialType;
  String socialUserId;
  String accessToken;

  User(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.socialType,
      this.socialUserId,
      this.accessToken});

  Map<String, dynamic> toJSON() => {
        'name': name,
        'email': email,
        'avatar': avatar,
        'socialType': socialType,
        'socialUserId': socialUserId,
        'accessToken': accessToken
      };

  User.fromJSON(Map<String, dynamic> parsedJson)
      : this.id = parsedJson['_id'],
        this.name = parsedJson['name'],
        this.email = parsedJson['email'],
        this.avatar = parsedJson['avatar'] ?? '';
}
