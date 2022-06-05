
class UserData {

  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  UserData({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    firstName = json['firstName']?.toString();
    lastName = json['lastName']?.toString();
    picture = json['picture']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}

class User {

  List<UserData?>? data;
  int? total;
  int? page;
  int? limit;

  User({
    this.data,
    this.total,
    this.page,
    this.limit,
  });
  User.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <UserData>[];
      v.forEach((v) {
        arr0.add(UserData.fromJson(v));
      });
      this.data = arr0;
    }
    total = json['total']?.toInt();
    page = json['page']?.toInt();
    limit = json['limit']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }
}
