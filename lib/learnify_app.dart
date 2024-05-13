import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'config/routes/app_router.dart';
import 'config/routes/app_routes.dart';

class EducateApp extends StatelessWidget {
  const EducateApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
          initialRoute: AppRoutes.splash,
        );
      },
    );
  }
}
