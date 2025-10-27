import 'package:calculator_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.background,
                
              ),
              child: Text("12+2", style: TextStyle(color: AppColor.textPrimary, fontSize: 20),
            ),
            ),
            SizedBox(height: 10,child: Divider(color: Colors.grey),),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
