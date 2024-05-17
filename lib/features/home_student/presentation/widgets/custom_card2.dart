import 'dart:core';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CustomCard2 extends StatelessWidget {
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

  CustomCard2({
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

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (enrolledStudents == 0) {
          showDialog(
            context: context,
            builder: (context) => _buildCourseDetailsDialog2(context),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => _buildCourseDetailsDialog(context),
          );
        }
      },
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
                      'Course Name: $name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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

                // const SizedBox(height: 8),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.calendar_today,
                //       size: 16,
                //       color: Colors.grey,
                //     ),
                //     const SizedBox(width: 4),
                //     Text(
                //       'Reviews : $reviews',
                //       style: const TextStyle(
                //         color: Colors.grey,
                //         fontSize: 14,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseDetailsDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryColor,
      title: const Text(
        'Course Details',
        style: TextStyle(color: AppColors.primaryColorLight),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Limit content height
        children: [
          Wrap(
            children: [
              const Text(
                'Name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(name!,
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Category: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(category!,
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          // Wrap(
          //   children: [
          //     const Text(
          //       'Rating: ',
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: AppColors.primaryColorLight,
          //       ),
          //     ),
          //     Text(rating.toString(),
          //         style: const TextStyle(color: AppColors.primaryColorLight)),
          //   ],
          // ),
          Wrap(
            children: [
              const Text(
                'Capacity: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(capacity.toString(),
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Published: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(published! ? 'Yes' : 'No',
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Enrolled Students: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(enrolledStudents.toString(),
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          // if (reviews!.isNotEmpty) // Check if reviews exist
          //   const Text(
          //     'Reviews:',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: AppColors.primaryColorLight,
          //     ),
          //   ),
          // if (reviews!.isNotEmpty) // Conditionally display reviews
          //   ListView.builder(
          //     shrinkWrap: true, // Prevent list from expanding
          //     itemCount: reviews?.length,
          //     itemBuilder: (context, index) {
          //       final review =
          //           reviews?[index]; // Assuming review data structure
          //       // Access and display review details (e.g., rating, content)
          //       return Text(
          //         ' - Review from ${review['user'] ?? 'Unknown User'}: ${review['content'] ?? 'No content provided'}',
          //         style: const TextStyle(color: AppColors.primaryColorLight),
          //       );
          //     },
          //   ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close',
              style: TextStyle(color: AppColors.primaryColorLight)),
        ),
      ],
    );
  }

  Widget _buildCourseDetailsDialog2(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryColor,
      title: const Text(
        'Course Details',
        style: TextStyle(color: AppColors.primaryColorLight),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Limit content height
        children: [
          Wrap(
            children: [
              const Text(
                'Name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(name!,
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Category: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(category!,
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          // Wrap(
          //   children: [
          //     const Text(
          //       'Rating: ',
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: AppColors.primaryColorLight,
          //       ),
          //     ),
          //     Text(rating.toString(),
          //         style: const TextStyle(color: AppColors.primaryColorLight)),
          //   ],
          // ),
          Wrap(
            children: [
              const Text(
                'Capacity: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(capacity.toString(),
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Published: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorLight,
                ),
              ),
              Text(published! ? 'Yes' : 'No',
                  style: const TextStyle(color: AppColors.primaryColorLight)),
            ],
          ),
          // if (reviews!.isNotEmpty) // Check if reviews exist
          //   const Text(
          //     'Reviews:',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: AppColors.primaryColorLight,
          //     ),
          //   ),
          // if (reviews!.isNotEmpty) // Conditionally display reviews
          //   ListView.builder(
          //     shrinkWrap: true, // Prevent list from expanding
          //     itemCount: reviews?.length,
          //     itemBuilder: (context, index) {
          //       final review =
          //           reviews?[index]; // Assuming review data structure
          //       // Access and display review details (e.g., rating, content)
          //       return Text(
          //         ' - Review from ${review['user'] ?? 'Unknown User'}: ${review['content'] ?? 'No content provided'}',
          //         style: const TextStyle(color: AppColors.primaryColorLight),
          //       );
          //     },
          //   ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close',
              style: TextStyle(color: AppColors.primaryColorLight)),
        ),
      ],
    );
  }
}
