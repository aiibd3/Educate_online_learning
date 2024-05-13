class SignupInstructorResponseBody {
  SignupInstructorResponseBody({
      this.message, 
      this.result, 
      this.token,});

  SignupInstructorResponseBody.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    token = json['token'];
  }
  String? message;
  Result? result;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class Result {
  Result({
      this.name, 
      this.email, 
      this.password, 
      this.role, 
      this.yearsOfExperience, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Result.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    yearsOfExperience = json['yearsOfExperience'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? name;
  String? email;
  String? password;
  String? role;
  int? yearsOfExperience;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['yearsOfExperience'] = yearsOfExperience;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}