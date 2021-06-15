class User {
  String? id;
  String? name, userName;
  String? location;
  String? bio;
  String? profileUrl;

  User(
      {this.id,
      this.name,
      this.userName,
      this.location,
      this.bio,
      this.profileUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['username'];
    bio = json['bio'];
    profileUrl = json['profile_image']['medium'];
  }
}
