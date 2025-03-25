import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/stars_generator.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/assets/assets_png.dart';
import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class DoctorCardDoctors extends StatelessWidget {
  final String? name;
  final double rating; // Rating value (out of 5)

  const DoctorCardDoctors({Key? key, this.name, this.rating = 4.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 134.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: CustomImageView(
                  imagePath: AssetsPng.appointmentTest.toPng(),
                  fit: BoxFit.cover,
                ),
              ),
              15.toWidth,
              Container(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name != null ? "Dr: $name" : "Dr : Hamdy Abdelfatah",
                      style: AppTextStyles.font20GreenW700,
                    ),
                    5.toHeight,
                    Text(
                      AppStrings.arabic,
                      style: AppTextStyles.font12GreenW500,
                    ),
                    5.toHeight,
                    StarsGenerator(rating: rating),
                    20.toHeight,
                    CustomButton(
                      text: AppStrings.viewProfile,
                      onTap: () {
                        // In Future we will send the Doctor to this Screen as an Argument
                        Navigator.pushNamed(
                            context, AppRoutes.doctorProfileScreen);
                      },
                      textStyle: AppTextStyles.font15WhiteW500,
                      height: 44.h,
                      width: 130.w,
                    )
                  ],
                ),
              )
            ],
          ),
          25.toHeight,
        ],
      ).paddingOnly(top: 5.h),
    );
  }
}
