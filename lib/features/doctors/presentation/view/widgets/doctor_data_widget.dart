import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/stars_generator.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/assets_png.dart';
import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class DoctorDataWidget extends StatelessWidget {
  const DoctorDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageOffset = constraints.maxWidth * 0.14;
        double contentPadding = constraints.maxWidth * 0.08; //For Width
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: Colors.white,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: imageOffset), // Push text below image
                  Text(
                    "Ali Maaloul",
                    style: AppTextStyles.font20GreenW700,
                  ),
                  StarsGenerator(rating: 4.23),
                  10.toHeight,
                  _buildDetailsRow(AssetsSvg.locationBlue.toSVG(),
                      AppStrings.location, "Cairo, Egypt"),
                  _buildDetailsRow(AssetsSvg.country.toSVG(), AppStrings.country,
                      "Kafr El Ababsa"),
                  _buildDetailsRow(
                      AssetsSvg.sessions.toSVG(), AppStrings.sessions, "1500"),
                  _buildDetailsRow(AssetsSvg.experience.toSVG(),
                      AppStrings.experience, "10 years"),
                ],
              ),
            ),
            PositionedDirectional(
              top: -imageOffset, // Adjust based on screen size
              start: 0,
              end: 0,
              child: Container(
                height: 110.w,
                width: 110.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/image/maalol.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailsRow(String icon, String mainText, String data) {
    return Row(
      children: [
        CustomImageView(svgPath: icon),
        5.toWidth,
        RichText(
          text: TextSpan(
            text: mainText,
            style: AppTextStyles.font12BlueW700,
            children: [
              TextSpan(text: " $data", style: AppTextStyles.font12GreenW700),
            ],
          ),
        )
      ],
    ).paddingSymmetric(vertical: 7.h);
  }
}
