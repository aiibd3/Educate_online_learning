class SignupStudentRequestBody {
  SignupStudentRequestBody({
      this.name, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.role,});

  SignupStudentRequestBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['role'] = role;
    return map;
  }

}