import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/token_manager.dart';
import '../../data/models/Login_request_body.dart';
import '../manager/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: Image(
                        image: AssetImage(AppAssets.logo4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            style: const TextStyle(height: 1),
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              suffixIcon: const Icon(Icons.email),
                            ),
                            validator: ValidationBuilder().email().build(),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
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
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                final requestBody = LoginRequestBody(
                                  email: email,
                                  password: password,
                                );
                                BlocProvider.of<LoginCubit>(context)
                                    .login(requestBody);

                                if (state is LoginSuccess) {
                                  final role = state.response.role;

                                  print('meelooooo ahoooo Email: $email');
                                  print(role);

                                  if (role == 'student') {
                                    TokenManager.token = state.response.token;

                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.homeStudent);
                                  } else if (role == 'instructor') {
                                    TokenManager.token = state.response.token;
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.homeInstructor);
                                  } else if (role == 'admin') {
                                    TokenManager.token = state.response.token;
                                    print(TokenManager.token);

                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.adminHome);
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Login successfully!')));

                                }

                                if (state is LoginInitial) {
                                  print(state);
                                }

                                if (state is LoginError) {
                                  print(state.error);
                                }

                                if (state is LoginLoading) {
                                  Lottie.asset(AppAssets.loading2);
                                }
                              }
                            },
                            child: const Text(
                              style: TextStyle(fontSize: 20),
                              "Login",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primaryColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.chooseRole);
                                  },
                                  child: const Text(
                                    selectionColor: AppColors.primaryColor,
                                    "Sign Up",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
