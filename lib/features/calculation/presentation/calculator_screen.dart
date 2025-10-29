import 'package:calculator_app/features/calculation/cubit/calculator_cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/core/theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final numbers = [
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    'C',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 40),
                _buildDisplay(),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),
                Expanded(child: _buildButtonsGrid(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// شاشة عرض النتائج والمعادلة
  Widget _buildDisplay() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: BlocConsumer<CalculatorCubit, CalculatorState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            String textToShow = '0';

            if (state is CalculatorInputChanged) {
              textToShow = state.expression;
            } else if (state is CalculatorResult) {
              textToShow = state.result;
            } else if (state is CalculatorError) {
              textToShow = state.message;
            }

            return Text(
              textToShow,
              style: const TextStyle(
                color: AppColor.textPrimary,
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      ),
    );
  }

  /// شبكة الأزرار (الأرقام + العمليات)
  Widget _buildButtonsGrid(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: numbers.map((number) => _buildButton(context, number)).toList(),
    );
  }

  /// عنصر الزر الواحد
  Widget _buildButton(BuildContext context, String number) {
    final isOperator = ['/', '*', '-', '+', '='].contains(number);
    final isClear = number == 'C';
    final cubit = context.read<CalculatorCubit>();

    return InkWell(
      onTap: () {
        if (isClear) {
          cubit.clear();
        } else if (number == '=') {
          cubit.calculate();
        } else {
          cubit.addCharacter(number);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isClear
              ? AppColor.clear
              : isOperator
              ? AppColor.operator
              : AppColor.buttonBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: isClear || isOperator
                  ? Colors.white
                  : AppColor.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
