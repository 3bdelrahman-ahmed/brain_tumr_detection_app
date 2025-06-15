import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/stars_generator.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/assets_png.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class DoctorDataWidget extends StatelessWidget {
  const DoctorDataWidget(
      {Key? key,
      required this.name,
      required this.rating,
      required this.location,
      required this.imageUrl,
      this.phoneNumber})
      : super(key: key);
  final String name;
  final double rating;
  final String location;
  final String? imageUrl;
  final String? phoneNumber;

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
                    name,
                    style: AppTextStyles.font20GreenW700,
                  ),
                  StarsGenerator(rating: rating),
                  10.toHeight,
                  _buildDetailsRow(AssetsSvg.locationBlue.toSVG(),
                      S.of(context).location, location),
                  _buildDetailsRow(AssetsSvg.country.toSVG(),
                      S.of(context).country, "Egypt"),
                  // _buildDetailsRow(AssetsSvg.sessions.toSVG(),
                  //     S.of(context).sessions, "1500"),
                  // _buildDetailsRow(AssetsSvg.experience.toSVG(),
                  //     S.of(context).experience, "10 years"),
                  _buildDetailsRow(
                      AssetsSvg.experience.toSVG(),
                      "${S.of(context).clinicPhoneNumber}: ",
                      phoneNumber ?? "01122224564"),
                ],
              ),
            ),
            PositionedDirectional(
              top: -imageOffset, // Adjust based on screen size
              start: 0,
              end: 0,
              child: Center(
                child: Container(
                    height: 110.w,
                    width: 110.w,
                    child: CustomProfileImage(
                      imageUrl: imageUrl,
                    )),
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
