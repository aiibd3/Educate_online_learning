class SearchCategoryRequestBody {
  SearchCategoryRequestBody({
      this.category,});

  SearchCategoryRequestBody.fromJson(dynamic json) {
    category = json['category'];
  }
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    return map;
  }

}