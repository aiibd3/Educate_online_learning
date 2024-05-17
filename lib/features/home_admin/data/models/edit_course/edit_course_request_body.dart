class EditCourseRequestBody {
  EditCourseRequestBody({
      this.courseName, 
      this.instructorName, 
      this.published, 
      this.category, 
      this.duration, 
      this.capacity,});

  EditCourseRequestBody.fromJson(dynamic json) {
    courseName = json['courseName'];
    instructorName = json['instructorName'];
    published = json['published'];
    category = json['category'];
    duration = json['duration'];
    capacity = json['capacity'];
  }
  String? courseName;
  String? instructorName;
  String? published;
  String? category;
  int? duration;
  int? capacity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseName'] = courseName;
    map['instructorName'] = instructorName;
    map['published'] = published;
    map['category'] = category;
    map['duration'] = duration;
    map['capacity'] = capacity;
    return map;
  }

}