import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class DiagnosisContainer extends StatelessWidget {
  const DiagnosisContainer(
      {Key? key, required this.head, required this.diagnosis})
      : super(key: key);
  final String head;
  final String diagnosis;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head,
            style: AppTextStyles.font14BlueW700,
          ),
          15.toHeight,
          Text(
            diagnosis,
            style: AppTextStyles.font15GreenW700,
          )
        ],
      ).paddingSymmetric(vertical: 20.h, horizontal: 15.w),
    ).paddingSymmetric(vertical: 15.h, horizontal: 15.w);
  }
}
