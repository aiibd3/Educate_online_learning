import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../manager/home_student_cubit.dart';
import 'custom_card2.dart';

class SearchScreen extends StatefulWidget {
  TextEditingController searchCourseController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStudentCubit, HomeStudentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Search Courses',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.homeStudent);
                },
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.grey[300],
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: widget.searchCourseController,
                      decoration: InputDecoration(
                        hintText: "Search Course",
                        prefixIcon: InkWell(
                          onTap: () {
                            BlocProvider.of<HomeStudentCubit>(context)
                                .search(widget.searchCourseController.text);
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
                BlocBuilder<HomeStudentCubit, HomeStudentState>(
                  builder: (context, state) {
                    if (state is SearchStudentSuccess) {
                      var courses = state.data;

                      return Expanded(
                        child: GridView.count(
                          crossAxisCount: 4,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height),
                          padding: const EdgeInsets.all(8),
                          children: courses
                              .map(
                                (course) => Card(
                                  margin: const EdgeInsets.all(4.0),
                                  child: CustomCard2(
                                    id: course.id,
                                    name: course.courseName,
                                    instructorId: course.user?.userId,
                                    category: course.category,
                                    capacity: course.capacity,
                                    published: course.published,
                                    enrolledStudents: 0,
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

                    if (state is HomeStudentError) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Sorry Something Went Wrong",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }

                    return Container();
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
