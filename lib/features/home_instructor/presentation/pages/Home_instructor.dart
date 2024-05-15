import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:side_sheet/side_sheet.dart';
import '../../../../config/routes/app_routes.dart';
import '../../data/models/create/Create_course_Request_body.dart';
import '../manager/create/home_instructor_cubit.dart';
import '../widgets/CustomCard.dart';

class HomeInstructor extends StatefulWidget {
  const HomeInstructor({super.key});

  @override
  State<HomeInstructor> createState() => _HomeInstructorState();
}

class _HomeInstructorState extends State<HomeInstructor> {
  final TextEditingController _nameCourseController = TextEditingController();
  final TextEditingController _searchCourseController = TextEditingController();
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
                icon: const Icon(Icons.logout, color: Colors.white),
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
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: _searchCourseController,
                    decoration: InputDecoration(
                      hintText: "Search Course",
                      prefixIcon: InkWell(
                        onTap: () {
                          BlocProvider.of<HomeInstructorCubit>(context)
                              .search(_searchCourseController.text);
                        },
                        child: const Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
                builder: (context, state) {
                  if (state is HomeInstructorInitial) {
                    return const Text(
                      "Search Course",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }

                  if (state is HomeInstructorLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state is HomeInstructorError) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Sorry No Course Found",
                        style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    );
                  }
                  if (state is SearchSuccess) {
                    if (state.data.isEmpty) {
                      return const Text("No Course Found");
                    }

                    var courses = state.data;

                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        padding: const EdgeInsets.all(8),
                        children: courses
                            .map(
                              (course) => Container(
                                margin: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.all(2.0),
                                child: UserCardAdmin(
                                  id: course.id,
                                  name: course.courseName,
                                  instructorId: course.user?.userId,
                                  category: course.category,
                                  capacity: course.capacity,
                                  published: course.published,
                                  enrolledStudents: course.enrolledStudents,
                                  createdAt: course.createdAt,
                                  updatedAt: course.updatedAt,
                                  v: course.v,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }

                  if (state is HomeInstructorGetCoursesSuccess) {
                    if (state.getCoursesResponseBody.data!.isEmpty) {
                      return const Text("No Course Found");
                    }
                    final courses = state.getCoursesResponseBody.data!;
                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                        padding: const EdgeInsets.all(8),
                        children: courses
                            .map(
                              (course) => Container(
                                margin: const EdgeInsets.all(4.0),
                                padding: const EdgeInsets.all(2.0),
                                child: UserCardAdmin(
                                  id: course.id,
                                  name: course.courseName,
                                  instructorId: course.user?.userId,
                                  category: course.category,
                                  capacity: course.capacity,
                                  published: course.published,
                                  enrolledStudents: course.enrolledStudents,
                                  createdAt: course.createdAt,
                                  updatedAt: course.updatedAt,
                                  v: course.v,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
