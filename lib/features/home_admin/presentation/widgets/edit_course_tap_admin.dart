import 'dart:core';
import 'package:educate/config/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/edit_course/edit_course_request_body.dart';
import '../manager/home_admin_cubit.dart';

class EditCourseTapAdmin extends StatefulWidget {
  final String? id;
  final String? name;
  final String? instructorId;
  final String? instructorName;
  final String? category;
  final int? duration;
  final int? capacity;
  final bool? published;
  final int? enrolledStudents;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const EditCourseTapAdmin({
    super.key,
    required this.instructorName,
    required this.id,
    required this.name,
    required this.instructorId,
    required this.category,
    required this.duration,
    required this.capacity,
    required this.published,
    required this.enrolledStudents,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  @override
  State<EditCourseTapAdmin> createState() => _EditCourseTapAdminState();
}

class _EditCourseTapAdminState extends State<EditCourseTapAdmin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _publishedController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _publishedController.text = widget.published?.toString() ?? '';
    _categoryController.text = widget.category ?? '';
    _durationController.text =
        widget.duration?.toString() ?? ''; // Assuming duration is not provided
    _capacityController.text = widget.capacity?.toString() ?? '';
  }

  @override
  void dispose() {
    _publishedController.dispose();
    _categoryController.dispose();
    _durationController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
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
                      'Course Name: ${widget.name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return _buildCourseDetailsDialog(context);
                          },
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
                  'Category: ${widget.category}',
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
                      'Instructor : ${widget.instructorId}',
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
                      'Created At: ${widget.createdAt}',
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
                      'Updated At: ${widget.updatedAt}',
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
      ),
    );
  }

  Widget _buildCourseDetailsDialog(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeAdminCubit>(),
        ),
      ],
      child: BlocConsumer<HomeAdminCubit, HomeAdminState>(
        listener: (context, state) {
          if (state is EditCourseSuccessAdmin) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Course updated successfully!'),
              ),
            );
          } else if (state is HomeAdminError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to update course: ${state.message}'),
              ),
            );
          }
        },
        builder: (context, state) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(100, 40),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final published =
                                          _publishedController.text;
                                      final category = _categoryController.text;
                                      final duration =
                                          int.parse(_durationController.text);
                                      final capacity =
                                          int.parse(_capacityController.text);

                                      final EditCourseRequestBody requestBody =
                                          EditCourseRequestBody(
                                        courseName: widget.name,
                                        instructorName: widget.instructorName,
                                        published: published,
                                        category: category,
                                        duration: duration,
                                        capacity: capacity,
                                      );

                                      BlocProvider.of<HomeAdminCubit>(context)
                                          .editCourse(requestBody);
                                    }
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
