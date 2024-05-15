import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class HomeStudent extends StatelessWidget {
  HomeStudent({super.key});

  final TextEditingController _searchCourseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Home Student',
            style: TextStyle(color: Colors.white),
          ),
        ),
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
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 10,
                color: Colors.black,
                child: Column(
                  children: [
                    CustomButton(
                      buttonText: "Get Courses",
                    ),
                    CustomButton(
                      buttonText: "Enroll Course",
                    ),
                    CustomButton(
                      buttonText: "Review Course",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
