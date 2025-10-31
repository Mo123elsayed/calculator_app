import 'dart:async';

import 'package:calculator_app/core/theme/app_text.dart';
import 'package:calculator_app/features/calculation/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  static const String screenRoute = '/home';
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '';
  String resultText = '';
  bool _showCursor = true;

  @override
  /// Initialize the state of the widget by starting a periodic timer
  /// that changes the show cursor state every 500 milliseconds.
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  /// Handle button click events.
  ///
  /// If the button text is 'C', it clears the display and result texts.
  ///
  /// If the button text is 'AC', it takes the result text and assigns it to the display text,
  /// then clears the result text.
  ///
  /// If the button text is '=', it calculates the result of the expression currently displayed on the calculator screen.
  ///
  /// For any other button text, it appends the button text to the display text.
  void btnClick(String? btnText) {
    setState(() {
      if (btnText == 'C') {
        // مسح الكل
        displayText = '';
        resultText = '';
      } else if (btnText == 'AC') {
        // خزن آخر نتيجة كعملية جديدة فوق
        if (resultText.isNotEmpty) {
          displayText = resultText;
          resultText = '';
        }
      } else if (btnText == '=') {
        calculateResult();
      } else {
        displayText += btnText!;
      }
    });
  }

  @override
  /// Builds the calculator screen widget.
  ///
  /// The calculator screen widget is a column of widgets. At the top of the column,
  /// there is an app bar with the title 'Calculator'. Below the app bar, there is a
  /// row of text widgets containing the display and result texts. The display text
  /// is displayed on the right side of the row, and the result text is displayed on
  /// the left side. The display text is displayed in a white color with a size of 30,
  /// and the result text is displayed in a grey color with a size of 24. The
  /// display text is also displayed with a cursor on the right side, which blinks
  /// every 500 milliseconds.
  ///
  /// Below the row of text widgets, there is a divider separating the text widgets from
  /// the rest of the calculator screen. Below the divider, there are four rows of custom
  /// button widgets. Each row contains four buttons, except for the last row which
  /// contains three buttons: '0', '.', and '='. The buttons are colored based on their
  /// functionality: the 'AC' and 'C' buttons are colored in the button background color,
  /// the 'X', '-', '+', and '=' buttons are colored in the operator color, and the rest of
  /// the buttons are colored in the button background color. The buttons also have an
  /// onTap callback function which handles the button click events.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator'), centerTitle: true),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    displayText.isEmpty
                        ? (_showCursor ? '|' : '')
                        : '$displayText',
                    style: AppText.white30Bold,
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(resultText, style: AppText.grey24Bold),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Text('AC', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.clear,
                    onTapBtn: btnClick,
                    child: Text('C', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.percent,
                      color: AppColor.operator,
                      size: 20.w,
                    ),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.divide,
                      color: AppColor.operator,
                      size: 20.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('7', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnColor: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('8', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('9', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.multiply,
                      color: AppColor.operator,
                      size: 20.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('4', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('5', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('6', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: AppColor.operator,
                      size: 28.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('1', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('2', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('3', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    btnColor: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: AppColor.operator,
                      size: 28.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    flex: 2,
                    child: Text('0', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnBckgrnd: AppColor.buttonBackground,
                    onTapBtn: btnClick,
                    child: Text('.', style: AppText.size20Bold),
                  ),
                  CustomButton(
                    btnColor: AppColor.buttonBackground,
                    btnBckgrnd: AppColor.operator,
                    onTapBtn: btnClick,
                    child: Icon(
                      FontAwesomeIcons.equals,
                      color: AppColor.operator,
                      size: 20.w,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Calculate the result of the expression currently displayed on the calculator screen.
  ///
  /// This function will first replace all occurrences of 'X' with '*' in the expression.
  // ignore: deprecated_member_use
  /// Then it will parse the expression and evaluate it using the [Parser] library.
  /// Finally, it will update the [resultText] with the result of the evaluation.
  /// If an error occurs during the evaluation, it will update [resultText] with 'Error'.
  ///
  void calculateResult() {
    try {
      String expression = displayText.replaceAll('×', '*');

      // ignore: deprecated_member_use
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      // ignore: deprecated_member_use
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        resultText = eval.toString();
      });
    } catch (e) {
      setState(() {
        resultText = 'Error';
      });
    }
  }
}
