import 'package:calculator_app/core/routing/app_router.dart';
import 'package:calculator_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CalculatorApp extends StatelessWidget {
  final AppRouter appRouter;
  const CalculatorApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Calculator App',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}