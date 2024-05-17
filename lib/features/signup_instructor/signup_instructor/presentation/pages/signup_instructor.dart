import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/signup_instructor_request_body.dart';
import '../manager/signup_instructor_cubit.dart';

class SignUpInstructor extends StatefulWidget {
  SignUpInstructor({super.key});

  @override
  State<SignUpInstructor> createState() => _SignUpInstructorState();
}

class _SignUpInstructorState extends State<SignUpInstructor> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _yearOfExperienceController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupInstructorCubit, SignupInstructorState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Center(
                      child: Image(
                        image: AssetImage(AppAssets.logo4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Image(
                          height: 70,
                          image: AssetImage(
                            AppAssets.logoH,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            style: const TextStyle(height: 1),
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.person),
                            ),
                            validator:
                                ValidationBuilder().maxLength(50).build(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 7),
                          child: TextFormField(
                            style: TextStyle(height: 1),
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.email),
                            ),
                            validator: ValidationBuilder()
                                .email()
                                .maxLength(50)
                                .build(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 7),
                          child: TextFormField(
                            style: const TextStyle(height: 1),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.remove_red_eye),
                            ),
                            validator: ValidationBuilder()
                                .minLength(6)
                                .maxLength(50)
                                .build(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 7),
                          child: TextFormField(
                            style: const TextStyle(height: 1),
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.remove_red_eye),
                            ),
                            validator: ValidationBuilder()
                                .minLength(6)
                                .maxLength(50)
                                .build(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 7),
                          child: TextFormField(
                            style: const TextStyle(height: 1),
                            controller: _yearOfExperienceController,
                            decoration: InputDecoration(
                              labelText: "Years of Experience",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.numbers),
                            ),
                            validator: ValidationBuilder()
                                .minLength(1)
                                .maxLength(3)
                                .build(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(170, 40),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final name = _nameController.text;
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                final confirmPassword =
                                    _confirmPasswordController.text;
                                final yearOfExperience =
                                    _yearOfExperienceController.text;

                                final requestBody = SignupInstructorRequestBody(
                                    name: name,
                                    email: email,
                                    password: password,
                                    confirmPassword: confirmPassword,
                                    yearsOfExperience: yearOfExperience,
                                    role: "instructor");

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Sign Up successfully!')));

                                BlocProvider.of<SignupInstructorCubit>(context)
                                    .signup(requestBody);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }
                            },
                            child: const Text(
                              style: TextStyle(fontSize: 20),
                              "Sign Up",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "You have an account?",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.primaryColor,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.login);
                                },
                                child: const Text(
                                  selectionColor: AppColors.primaryColor,
                                  "Login",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
