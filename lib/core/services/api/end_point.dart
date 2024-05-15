class EndPoints {
  static String baseUrl = "http://localhost:5000";
  static String baseUrl2 = "http://localhost:5001";

  // Auth
  static String auth = "/auth";
  static String signInEndPoint = "$auth/signIn";
  static String signUpEndPoint = "$auth/signUp";

  // Course
  static String course = "/course";

  // Create Course
  static String createCourseEndPoint = "$course/create";

  // Search Category
  static String searchCategory = "$course/searchCategory";

  // Search Name
  static String searchName = "$course/searchName";

  static String myCourses = "$course/myCourses";
}
