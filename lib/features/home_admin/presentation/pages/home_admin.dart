import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Home Admin',
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
              child: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/educateW.png",
                      width: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.library_books,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.publishedCoursesAdmin);
                            },
                            child: const Text(
                              'Published',
                              style: TextStyle(
                                  color: Colors.white,
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
                            Icons.library_books_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.unpublishedCoursesAdmin);
                            },
                            child: const Text(
                              'UnPublished',
                              style: TextStyle(
                                  color: Colors.white,
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
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            const Text(
              "Hello Admin ;)",
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
  }
}
