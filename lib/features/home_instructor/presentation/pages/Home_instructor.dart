import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:side_sheet/side_sheet.dart';
import '../../../../config/routes/app_routes.dart';
import '../../data/models/create/Create_course_Request_body.dart';
import '../manager/create/home_instructor_cubit.dart';

class HomeInstructor extends StatefulWidget {
  const HomeInstructor({super.key});

  @override
  State<HomeInstructor> createState() => _HomeInstructorState();
}

class _HomeInstructorState extends State<HomeInstructor> {
  final TextEditingController _nameCourseController = TextEditingController();
  final TextEditingController _durationCourseController =
      TextEditingController();
  final TextEditingController _capacityCourseController =
      TextEditingController();
  final TextEditingController _categoryCourseController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Home Instructor',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.logout, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed: () async {
              await SideSheet.right(
                context: context,
                width: Checkbox.width * 20,
                body: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Create Course",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _nameCourseController,
                          validator: ValidationBuilder()
                              .minLength(1)
                              .maxLength(50)
                              .build(),
                          decoration: const InputDecoration(
                            hintText: "Name Course",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _durationCourseController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a value';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Duration Course",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _capacityCourseController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a value';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Capacity Course",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _categoryCourseController,
                          validator: ValidationBuilder()
                              .minLength(1)
                              .maxLength(50)
                              .build(),
                          decoration: const InputDecoration(
                            hintText: "Category Course",
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final name = _nameCourseController.text;
                            final duration =
                                int.parse(_durationCourseController.text);
                            final capacity =
                                int.parse(_capacityCourseController.text);
                            final category = _categoryCourseController.text;

                            final CreateCourseRequestBody
                                createCourseRequestBody =
                                CreateCourseRequestBody(
                                    courseName: name,
                                    duration: duration,
                                    capacity: capacity,
                                    category: category);

                            BlocProvider.of<HomeInstructorCubit>(context)
                                .createCourse(createCourseRequestBody);
                            Navigator.pop(context);
                            print("Name: $name");
                            print("Duration: $duration");
                            print("Capacity: $capacity");
                            print("Category: $category");
                          }
                        },
                        child: const Text(
                          "Create Course",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.homeInstructor);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: Row(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/educateB.png",
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home,
                              size: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.myCoursesInstructor);
                              },
                              child: const Text(
                                'My Courses',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.searchCoursesInstructor);
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.library_books,
                              size: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.publishedCoursesInstructor);
                              },
                              child: const Text(
                                'Published',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const Text(
                  "Hello Instructor, Welcome to your dashboard ;)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
