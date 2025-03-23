import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/scan/view/widgets/file_data_row.dart';
import 'package:brain_tumr_detection_app/features/scan/viewmodel/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/string/app_string.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScanCubit>();
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomWelcomeAppBar(),
        SliverPadding(padding: EdgeInsets.symmetric(vertical:15.h)),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () => cubit.pickFile(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(0, 2))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  CustomImageView(
                    svgPath: AssetsSvg.file.toSVG(),
                  ),
                  5.toHeight,
                  Text(
                    AppStrings.uploadYourFileHere,
                    style: AppTextStyles.font15GreenW700,
                  ),
                  5.toHeight,
                  Text(
                    AppStrings.supportedFiles,
                    style: AppTextStyles.font12LightGreenW500,
                  )
                ],
              ),
            ).paddingSymmetric(vertical: 20.h, horizontal: 20.w),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.h)),
        SliverToBoxAdapter(
          child: FileDataRow(),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.h)),
        SliverToBoxAdapter(
          child: CustomButton(
              text: AppStrings.done,
              onTap: () {
                _showSuccessDialog(context);
              }).paddingSymmetric(horizontal: 30.w),
        )
      ],
    ));
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: AssetsSvg.done.toSVG(),
                ),
                20.toHeight,
                Text(
                  AppStrings.mriFileUploaded,
                  style: AppTextStyles.font15GreenW700,
                ),
                10.toHeight,
                Text(
                  AppStrings.youWillRecieveNotificationSoon,
                  style: AppTextStyles.font12LightGreenW500,
                ),
                20.toHeight,
                CustomButton(
                  text: AppStrings.returnPage,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
