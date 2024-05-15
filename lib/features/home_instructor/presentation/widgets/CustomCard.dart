import 'dart:core';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class UserCardAdmin extends StatelessWidget {
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

  UserCardAdmin({
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => _buildCourseDetailsDialog(context),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.3, // Adjust width for desired size
        height: MediaQuery.of(context).size.height *
            0.3, // Adjust height for desired size
        decoration: BoxDecoration(
          // color: Colors.grey[800],
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600]!.withOpacity(0.5),
              blurRadius: 4.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Course: $name',
                      style: const TextStyle(
                        color: AppColors.primaryColorLight,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info),
                      color: AppColors.primaryColorLight,
                      iconSize: 18.0,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              _buildCourseDetailsDialog(context),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'ID: $id',
                style: const TextStyle(color: AppColors.primaryColorLight),
              ),
              const SizedBox(height: 4.0),
              Wrap(
                children: [
                  Text(
                    'Category:$category',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColorLight,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 4.0),
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
              //         style:
              //             const TextStyle(color: AppColors.primaryColorLight)),
              //   ],
              // ),
              const SizedBox(height: 4.0),
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
                      style:
                          const TextStyle(color: AppColors.primaryColorLight)),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                published! ? 'Published' : 'Unpublished',
                style: const TextStyle(color: AppColors.primaryColorLight),
              ),
              const SizedBox(height: 4.0),
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
                      style:
                          const TextStyle(color: AppColors.primaryColorLight)),
                ],
              ),
              // const SizedBox(height: 4.0),
              // Wrap(
              //   children: [
              //     const Text(
              //       ' reviews: ',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: AppColors.primaryColorLight,
              //       ),
              //     ),
              //     Text(reviews.toString(),
              //         style:
              //             const TextStyle(color: AppColors.primaryColorLight)),
              //   ],
              // ),
              Wrap(
                children: [
                  const Text(
                    'create at: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColorLight,
                    ),
                  ),
                  Text(createdAt.toString(),
                      style:
                          const TextStyle(color: AppColors.primaryColorLight)),
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    'update at: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColorLight,
                    ),
                  ),
                  Text(updatedAt.toString(),
                      style:
                          const TextStyle(color: AppColors.primaryColorLight)),
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    'v: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColorLight,
                    ),
                  ),
                  Text(v.toString(),
                      style:
                          const TextStyle(color: AppColors.primaryColorLight)),
                ],
              ),
            ],
          ),
        ),
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
}
