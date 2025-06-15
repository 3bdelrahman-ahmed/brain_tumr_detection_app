import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../generated/l10n.dart';
import '../../utils/theme/colors/app_colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> items;
  String? hintText;
  String? selectedValue;
  final Function(String) onItemSelected;

  CustomDropDownMenu({
    super.key,
    required this.items,
    required this.hintText,
    required this.selectedValue,
    required this.onItemSelected,
  });

  @override
  CustomDropDownMenuState createState() => CustomDropDownMenuState();
}

class CustomDropDownMenuState extends State<CustomDropDownMenu> {
  Future<void> reset() async {
    print("reset function called");
    setState(() {
      widget.hintText = S.of(context).selectClinic;
      widget.selectedValue = widget.hintText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("selected text ${widget.selectedValue}");
    return PopupMenuButton<String>(
      splashRadius: 0,
      menuPadding: EdgeInsets.symmetric(horizontal: 12.w),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.transparent)),
      position: PopupMenuPosition.under,
      color: AppColors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 40.w, maxHeight: 224.h),
      onSelected: (String value) {
        setState(() {
          widget.selectedValue = value;
        });
        widget.onItemSelected(value);
      },
      itemBuilder: (BuildContext context) {
        return widget.items.map((String item) {
          return PopupMenuItem<String>(
            padding: EdgeInsets.zero,
            value: item,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(item,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font15BlackW700
                              .copyWith(fontSize: 16.sp)),
                    )
                  ],
                ),
                if (item != widget.items[widget.items.length - 1])
                  Divider(
                    thickness: 0.8.h,
                    height: 30.h,
                    color: AppColors.gradientBackground.withOpacity(0.6),
                  ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: widget.selectedValue == widget.hintText
                ? AppColors.buttonsAndNav.withOpacity(0.4) // Hint color
                : AppColors.buttonsAndNav,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(svgPath: AssetsSvg.calendar.toSVG()),
            8.toWidth,
            SizedBox(
              width: 175.w,
              child: Text(
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.selectedValue ?? widget.hintText ?? '',
                style: AppTextStyles.font10BlueW600.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: widget.selectedValue == widget.hintText
                      ? AppColors.black // Hint color
                      : AppColors.buttonsAndNav,
                ),
              ),
            ),
            const Spacer(),
            Icon(
                size: 24.w,
                Icons.keyboard_arrow_down,
                color: AppColors.buttonsAndNav),
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
  }
}
