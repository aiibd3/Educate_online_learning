import 'package:educate/features/home_admin/presentation/manager/home_admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../home_student/presentation/widgets/custom_card2.dart';
import 'edit_course_tap_admin.dart';

class PublishedScreenAdmin extends StatelessWidget {
  const PublishedScreenAdmin({super.key});

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
              Navigator.of(context).pushReplacementNamed(AppRoutes.adminHome);
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeAdminCubit, HomeAdminState>(
        builder: (context, state) {
          if (state is PublishedSuccessAdmin) {
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
                        child: EditCourseTapAdmin(
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

          if (state is HomeAdminError) {
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
