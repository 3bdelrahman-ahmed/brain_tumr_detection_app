import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/model/detection_response.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class ScanRow extends StatelessWidget {
  const ScanRow({super.key, required this.scan});

  final DetectionItem scan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: scan.isReviewed ? () => Navigator.pushNamed(
          context, AppRoutes.detailedScanResultScreen, arguments: {
        "doctorReview": scan.doctorReview,
        "detectionClass": scan.detectionClass
      }) : (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.buttonsAndNav),
        ),
        child: Row(
          children: [
            CustomImageView(
              svgPath: AssetsSvg.file.toSVG(),
              height: 30.w,
              width: 30.w,
              color: AppColors.buttonsAndNav,
            ),
            SizedBox(width: 12.w),
            Text(
              scan.isReviewed
                  ? S.of(context).resultIsReviewed
                  : S.of(context).underReview,
              style: AppTextStyles.font14BlueW700,
            ),
            5.toWidth,
            scan.isReviewed
                ? CustomImageView(
                    svgPath: AssetsSvg.done.toSVG(),
                    height: 30.h,
                    width: 30.h,
                  )
                : SizedBox(),
            Spacer(),
            Text(
              "${scan.uploadDate.month}-${scan.uploadDate.day}",
              style: AppTextStyles.font10BlueW600,
            ),
          ],
        ),
      ),
    );
  }
}
