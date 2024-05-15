import '../manager/create/home_instructor_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomCard.dart';

class SearchName extends StatelessWidget {
  const SearchName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
      builder: (context, state) {
        if (state is HomeInstructorSearchSuccess) {
          if (state.searchResponseBody.data!.isEmpty) {
            return const Text("No Course Found");
          }

          final courses = state.searchResponseBody.data!;
          print("aaaaaaaaaaaaaaaaacourses: ${courses[0].courseName}");
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
        return Container();
      },
    );
  }
}
