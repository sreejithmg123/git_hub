class User {
  String? name;
  String? login;
  int? id;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  User(
      {this.name,
      this.login,
      this.id,
      this.followersUrl,
      this.followingUrl,
      this.htmlUrl});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      login: json['login'],
      id: json['id'],
      followersUrl: json['followers_url'],
      followingUrl: json['following_url'],
      htmlUrl: json['html_url'],
    );
  }
}
