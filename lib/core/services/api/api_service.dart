import 'package:dio/dio.dart';
import 'package:educate/features/login/data/models/Login_request_body.dart';
import 'package:injectable/injectable.dart';
import '../../../features/home_instructor/data/models/create/Create_course_Request_body.dart';
import '../../../features/home_instructor/data/models/create/Create_course_response_body.dart';
import '../../../features/home_instructor/data/models/search/search_response_body.dart';
import '../../../features/login/data/models/login_response_body.dart';
import '../../../features/signup_instructor/signup_instructor/data/models/signup_instructor_request_body.dart';
import '../../../features/signup_instructor/signup_instructor/data/models/signup_instructor_response_body.dart';
import '../../../features/signup_student/data/models/signup_student_request_body.dart';
import '../../../features/signup_student/data/models/signup_student_response_body.dart';
import '../../utils/token_manager.dart';
import 'end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiService {
  ApiService() {
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    );
    dio2.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    );
  }

  static final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  static final Dio dio2 = Dio(BaseOptions(baseUrl: EndPoints.baseUrl2));

  // Login
  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async {
    try {
      final Map<String, dynamic> data = {
        "email": loginRequestBody.email,
        "password": loginRequestBody.password,
      };
      final response = await dio.post(EndPoints.signInEndPoint, data: data);
      final myToken = LoginResponseBody.fromJson(response.data);
      print("Token: ${myToken.token}");
      return LoginResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }

  // Signup Instructor
  Future<SignupInstructorResponseBody> signupInstructor(
      SignupInstructorRequestBody signupInstructorRequestBody) async {
    try {
      final response = await dio.post(EndPoints.signUpEndPoint,
          data: signupInstructorRequestBody.toJson());

      return SignupInstructorResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }

  // Signup Student
  Future<SignupStudentResponseBody> signupStudent(
      SignupStudentRequestBody signupStudentRequestBody) async {
    try {
      final response = await dio.post(EndPoints.signUpEndPoint,
          data: signupStudentRequestBody.toJson());
      return SignupStudentResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }

  // Create Course
  Future<CreateCourseResponseBody> createCourse(
      CreateCourseRequestBody createCourseRequestBody) async {
    try {
      dio2.options.headers = {
        "token": TokenManager.token,
      };
      final response = await dio2.post(EndPoints.createCourseEndPoint,
          data: createCourseRequestBody.toJson());
      return CreateCourseResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }

  // Search Category

  // Search Name
  Future<SearchResponseBody> searchName(String name) async {
    try {
      // dio2.options.headers = {
      //   "token": TokenManager.token,
      // };

      dio2.options.headers = {
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoiNjYzZmZjMzRlYWFlNzY2NTMwZTgzZTU3IiwicGFzc3dvcmQiOiIxMjM0NTY3In0sImlhdCI6MTcxNTU2MDU2OSwiZXhwIjozNDMzNzEzMTM4fQ.RwAQ5XiWpGBxzcN1KsDlb4urwiGmdzeZt_Txtl0UmBU",
      };
      final response = await dio2
          .post(EndPoints.searchName, queryParameters: {"name": name});
      return SearchResponseBody.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }
}

// void main() async {
//   try {
//     final CreateCourseResponseBody viewAccountsResponse = await ApiService().createCourse(
//         CreateCourseRequestBody(
//             capacity: 10,
//             category: "testrrrrrr",
//             courseName: "testuuuu",
//             duration: 10));
//
//     print(viewAccountsResponse.data);
//
//     print(viewAccountsResponse); // Print the response data for inspection
//   } on Exception catch (e) {
//     print('Error fetching accounts: $e');
//   }
// }
