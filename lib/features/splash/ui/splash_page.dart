import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/theme/app_assets.dart';
import '../../login/presentation/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // if(token != null && token !="") {
      //
      //   Navigator.pushReplacementNamed(context, AppRoutes.homeInstructor);
      // }else {
      //   Navigator.pushReplacementNamed(context, AppRoutes.login);
      // }
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          key: UniqueKey(),
          width: 50.w,
          child: Lottie.asset(AppAssets.loading3),
        ),
      ),
    );
  }
}
