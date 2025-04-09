import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

class CustomUploadImageIcon extends StatelessWidget {
  const CustomUploadImageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomImageView(
          imagePath: AssetsPng.person.toPng(),
          width: 100.w,
          height: 100.w,
        ),
        PositionedDirectional(
          bottom: 0,
          end: -2.w,
          child: CustomImageView(
            svgPath: AssetsSvg.uploadImage.toSVG(),
            width: 40.w,
            height: 40.w,
          ),
        )
      ],
    );
  }
}
