import 'package:calculator_app/features/calculation/presentation/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.dark(),
          title: 'Calculator App',
          debugShowCheckedModeBanner: false,
          home: const CalculatorScreen(),
        );
      },
    );
  }
}
