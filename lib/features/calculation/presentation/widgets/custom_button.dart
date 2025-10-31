import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color? btnColor;
  Color? btnBckgrnd;
  Widget? child;
  int? flex;
  Function? onTapBtn;
  CustomButton({
    super.key,
    this.btnColor,
    this.btnBckgrnd,
    this.child,
    this.flex,
    this.onTapBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex == null ? 1 : flex!,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.r),

        onTap: () {
          onTapBtn!(child);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: btnBckgrnd ?? Colors.grey,
            borderRadius: BorderRadius.circular(50.r),
          ),
          margin: EdgeInsets.all(8.w),
          height: 80.h,
          width: 70.w,
          child: child,
        ),
      ),
    );
  }
}
