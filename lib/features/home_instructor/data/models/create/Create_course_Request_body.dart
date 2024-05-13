class CreateCourseRequestBody {
  CreateCourseRequestBody({
      this.courseName, 
      this.duration, 
      this.capacity, 
      this.category,});

  CreateCourseRequestBody.fromJson(dynamic json) {
    courseName = json['courseName'];
    duration = json['duration'];
    capacity = json['capacity'];
    category = json['category'];
  }
  String? courseName;
  int? duration;
  int? capacity;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseName'] = courseName;
    map['duration'] = duration;
    map['capacity'] = capacity;
    map['category'] = category;
    return map;
  }

}