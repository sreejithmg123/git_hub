class Repo {
  String? name;
  String? htmlUrl;
  String? description;
  Repo({this.name, this.description, this.htmlUrl});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
        name: json['name'],
        htmlUrl: json['htmlUrl'],
        description: json['description']);
  }
}

class RepoList {
  List<Repo>? repoList;
  RepoList({this.repoList});
  factory RepoList.fromjson(List<dynamic> json) {
    List<Repo> repoList = [];
    repoList = json.map((e) => Repo.fromJson(e)).toList();
    return RepoList(repoList: repoList);
  }
}
