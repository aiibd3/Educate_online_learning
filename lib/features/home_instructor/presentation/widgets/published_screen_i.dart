import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../home_student/presentation/widgets/custom_card2.dart';

class PublishedScreenI extends StatelessWidget {
  const PublishedScreenI({super.key});

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
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeInstructor);
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
        child: BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
          builder: (context, state) {
            if (state is PublishedSuccessInstructor) {
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

            if (state is HomeInstructorError) {
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
      ),
    );
  }
}
