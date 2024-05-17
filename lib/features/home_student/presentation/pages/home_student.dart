import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../manager/home_student_cubit.dart';

class HomeStudent extends StatefulWidget {
  const HomeStudent({super.key});

  @override
  State<HomeStudent> createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStudentCubit, HomeStudentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Home Student',
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
                              Icons.search,
                              size: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.searchCoursesStudent);
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
                                    AppRoutes.publishedCoursesStudent);
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
                  "Hello Student, Welcome to your dashboard ;)",
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
