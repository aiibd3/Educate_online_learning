class CreateCourseResponseBody {
  CreateCourseResponseBody({
      this.message, 
      this.data,});

  CreateCourseResponseBody.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.courseName, 
      this.duration, 
      this.category, 
      this.capacity, 
      this.enrolledStudents, 
      this.user, 
      this.published, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    courseName = json['courseName'];
    duration = json['duration'];
    category = json['category'];
    capacity = json['capacity'];
    enrolledStudents = json['enrolledStudents'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    published = json['published'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? courseName;
  int? duration;
  String? category;
  int? capacity;
  int? enrolledStudents;
  User? user;
  bool? published;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseName'] = courseName;
    map['duration'] = duration;
    map['category'] = category;
    map['capacity'] = capacity;
    map['enrolledStudents'] = enrolledStudents;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['published'] = published;
    map['_id'] = id;
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