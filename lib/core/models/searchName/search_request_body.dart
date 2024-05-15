class SearchRequestBody {
  SearchRequestBody({
      this.courseName,});

  SearchRequestBody.fromJson(dynamic json) {
    courseName = json['courseName'];
  }
  String? courseName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseName'] = courseName;
    return map;
  }

}