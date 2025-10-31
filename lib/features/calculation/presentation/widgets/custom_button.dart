import 'package:calculator_app/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color? btnColor;
  Color? btnBckgrnd;
  String? btnTxt;
  int? flex;
  Function? onTapBtn;
  CustomButton({
    super.key,
    this.btnColor,
    this.btnBckgrnd,
    this.btnTxt,
    this.flex,
    this.onTapBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex == null ? 1 : flex!,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: btnBckgrnd ?? Colors.grey,
          borderRadius: BorderRadius.circular(100.r),
        ),
        margin: EdgeInsets.all(8.w),
        height: 80.h,
        width: 70.w,
        child: InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: () {
            onTapBtn!(btnTxt);
          },
          child: Text(
            btnTxt!,
            style: AppText.size30Bold.copyWith(color: btnColor),
          ),
        ),
      ),
    );
  }
}
