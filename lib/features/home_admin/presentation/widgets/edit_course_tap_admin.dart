import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../manager/home_admin_cubit.dart';

class EditCourseTapAdmin extends StatelessWidget {
  final String? id;
  final String? name;

  final String? instructorId;
  final String? category;

  final int? capacity;
  final bool? published;
  final int? enrolledStudents;

  // final List<dynamic>? reviews;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  EditCourseTapAdmin({
    required this.id,
    required this.name,
    required this.instructorId,
    required this.category,
    required this.capacity,
    required this.published,
    required this.enrolledStudents,
    // required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _publishedController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Course Name: $name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            _buildCourseDetailsDialog(context),
                      );
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Category: $category',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Instructor : $instructorId',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Created At: $createdAt',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Updated At: $updatedAt',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseDetailsDialog(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _publishedController,
                        decoration:
                            const InputDecoration(labelText: 'Published'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter published status';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _categoryController,
                        decoration:
                            const InputDecoration(labelText: 'Category'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a category';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _durationController,
                        decoration:
                            const InputDecoration(labelText: 'Duration'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a duration';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _capacityController,
                        decoration:
                            const InputDecoration(labelText: 'Capacity'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a capacity';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: BlocBuilder<HomeAdminCubit, HomeAdminState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 40),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Map<String, dynamic> course = {
                                    "published": _publishedController.text,
                                    "category": _categoryController.text,
                                    "duration":
                                        int.parse(_durationController.text),
                                    "capacity":
                                        int.parse(_capacityController.text),
                                  };
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Course updated successfully!')));
                                  print(course);
                                  print(course['published']);
                                  print(course['category']);
                                  print(course['duration']);
                                  print(course['capacity']);
                                }
                              },
                              child: const Text(
                                'OKK',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 40),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
