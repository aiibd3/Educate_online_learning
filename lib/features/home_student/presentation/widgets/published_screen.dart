import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../manager/home_student_cubit.dart';
import 'custom_card2.dart';

class PublishedScreen extends StatelessWidget {
  const PublishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Published Courses',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeStudent);
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_outlined, color: Colors.white),
            ),
          ),

        ],
      ),

      body: BlocBuilder<HomeStudentCubit, HomeStudentState>(
        builder: (context, state) {
          if (state is PublishedSuccess) {
            var courses = state.publishedResponseBody.data;

            return Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height),
                padding: const EdgeInsets.all(8),
                children: courses!
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

          if (state is HomeStudentError) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Sorry Something Went Wrong",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
