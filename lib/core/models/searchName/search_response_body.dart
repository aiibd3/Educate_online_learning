class SearchResponseBody {
  SearchResponseBody({
      this.message, 
      this.data,});

  SearchResponseBody.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.user, 
      this.id, 
      this.courseName, 
      this.duration, 
      this.category, 
      this.capacity, 
      this.enrolledStudents, 
      this.published, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    id = json['_id'];
    courseName = json['courseName'];
    duration = json['duration'];
    category = json['category'];
    capacity = json['capacity'];
    enrolledStudents = json['enrolledStudents'];
    published = json['published'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  User? user;
  String? id;
  String? courseName;
  int? duration;
  String? category;
  int? capacity;
  int? enrolledStudents;
  bool? published;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['_id'] = id;
    map['courseName'] = courseName;
    map['duration'] = duration;
    map['category'] = category;
    map['capacity'] = capacity;
    map['enrolledStudents'] = enrolledStudents;
    map['published'] = published;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class User {
  User({
      this.userId, 
      this.userName, 
      this.userEmail,});

  User.fromJson(dynamic json) {
    userId = json['userId'];
    userName = json['userName'];
    userEmail = json['userEmail'];
  }
  String? userId;
  String? userName;
  String? userEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userName'] = userName;
    map['userEmail'] = userEmail;
    return map;
  }

}