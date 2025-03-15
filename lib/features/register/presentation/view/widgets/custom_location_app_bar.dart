import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomLocationAppBar extends StatelessWidget {
  const CustomLocationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)),
          10.toWidth,
          Text(AppString.setYourLocation,style: AppTextStyles.font20GreenW500,),
          Spacer(),
          InkWell(
            onTap: () {

            },
              child: Icon(Icons.search))
        ],
      ).paddingOnly(left: 20.w,right: 20.w, top: 10.h),
    );
  }
}
