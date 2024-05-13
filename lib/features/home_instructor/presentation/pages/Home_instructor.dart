import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../../core/theme/app_assets.dart';
import '../../data/models/create/Create_course_Request_body.dart';
import '../widgets/CustomCard.dart';

class HomeInstructor extends StatefulWidget {
  const HomeInstructor({super.key});

  @override
  State<HomeInstructor> createState() => _HomeInstructorState();
}

class _HomeInstructorState extends State<HomeInstructor> {
  final TextEditingController _nameCourseController = TextEditingController();
  final TextEditingController _nameSearchCourseController =
      TextEditingController();
  final TextEditingController _durationCourseController =
      TextEditingController();
  final TextEditingController _capacityCourseController =
      TextEditingController();
  final TextEditingController _categoryCourseController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context2) {
    return BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            backgroundColor: Colors.grey[200],
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
                    Navigator.of(context).pushReplacementNamed('/login');
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
                  body: Column(
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
                          validator: ValidationBuilder()
                              .minLength(1)
                              .maxLength(50)
                              .build(),
                          decoration: const InputDecoration(
                            hintText: "Duration Course",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _capacityCourseController,
                          validator: ValidationBuilder()
                              .minLength(1)
                              .maxLength(50)
                              .build(),
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
                      )
                    ],
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
                    color: Colors.white, // Add this line
                    child: TextFormField(
                      controller: _nameSearchCourseController,
                      decoration: InputDecoration(
                        hintText: "Search Course",
                        prefixIcon: InkWell(
                          onTap: () {
                            BlocProvider.of<HomeInstructorCubit>(context)
                                .searchCourse(_nameSearchCourseController.text);
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    }
                    if (state is HomeInstructorLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is HomeInstructorSearchSuccess) {
                      if (state.searchResponseBody.data!.isEmpty) {
                        return const Text("No Course Found");
                      }
                      final courses = state.searchResponseBody.data!;
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
                    return const Text("Oops! Something went wrong.");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
