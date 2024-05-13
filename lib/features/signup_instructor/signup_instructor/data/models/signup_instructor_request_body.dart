class SignupInstructorRequestBody {
  SignupInstructorRequestBody({
      this.name, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.role, 
      this.yearsOfExperience});

  SignupInstructorRequestBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    role = json['role'];
    yearsOfExperience = json['yearsOfExperience'];
  }
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? role;
  String? yearsOfExperience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['role'] = role;
    map['yearsOfExperience'] = yearsOfExperience;
    return map;
  }

}