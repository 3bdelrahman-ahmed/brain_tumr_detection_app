import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../generated/l10n.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imagePath;
  final String? svgPath;
  final IconData? icon;
  final double? imageSize;
  final Widget? customChild;
  final VoidCallback? onTap;
  final String? buttonText;
  final bool showButton;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const CustomEmptyWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.imagePath,
    this.svgPath,
    this.icon,
    this.imageSize,
    this.customChild,
    this.onTap,
    this.buttonText,
    this.showButton = false,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  /// Empty widget for reports
  factory CustomEmptyWidget.reports() {
    return CustomEmptyWidget(
      title: S.current.noReportsYet,
      svgPath: AssetsSvg.doctor.toSVG(),
      imageSize: 120,
    );
  }

  /// Empty widget for doctors
  factory CustomEmptyWidget.doctors() {
    return CustomEmptyWidget(
      title: S.current.noDoctorsFound,
      imagePath: AssetsPng.doctorTest.toPng(),
      imageSize: 120,
    );
  }

  /// Empty widget for appointments
  factory CustomEmptyWidget.appointments() {
    return CustomEmptyWidget(
      title: S.current.noAppointments,
      svgPath: AssetsSvg.calendar.toSVG(),
      imageSize: 120,
    );
  }

  /// Empty widget for notifications
  factory CustomEmptyWidget.notifications() {
    return CustomEmptyWidget(
      title: S.current.noNotifications,
      imagePath: AssetsPng.notifications.toPng(),
      imageSize: 100,
    );
  }

  /// Empty widget for chats
  factory CustomEmptyWidget.chats() {
    return CustomEmptyWidget(
      title: S.current.noChats,
      imagePath: AssetsPng.chat.toPng(),
      imageSize: 100,
    );
  }

  factory CustomEmptyWidget.scans() {
    return CustomEmptyWidget(
      title: S.current.noScans,
      svgPath: AssetsSvg.noScan.toSVG(),
      imageSize: 100,
    );
  }

  /// Empty widget for search results
  factory CustomEmptyWidget.searchResults({String? searchTerm}) {
    return CustomEmptyWidget(
      title: S.current.noDataAvailable,
      subtitle: searchTerm != null
          ? S.current.noSearchResultsFor + searchTerm
          : S.current.noSearchResultsFor,
      icon: Icons.search_off,
      imageSize: 80,
    );
  }

  /// Empty widget for generic no data
  factory CustomEmptyWidget.noData() {
    return CustomEmptyWidget(
      title: S.current.noDataAvailable,
      icon: Icons.inbox_outlined,
      imageSize: 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      decoration: backgroundColor != null
          ? BoxDecoration(color: backgroundColor)
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image/Icon Section
          _buildImageSection(),

          20.toHeight,

          // Title
          if (title != null)
            Text(
              title!,
              style: AppTextStyles.font20GreenW700.copyWith(
                color: AppColors.typography,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),

          if (title != null && subtitle != null) 12.toHeight,

          // Subtitle
          if (subtitle != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                subtitle!,
                style: AppTextStyles.font15LightGreenW500.copyWith(
                  color: AppColors.typographyLowOpacity,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
                .animate(delay: 200.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0),

          // Custom child widget
          if (customChild != null) ...[
            20.toHeight,
            customChild!,
          ],

          // Button (if enabled)
          if (showButton && onTap != null) ...[
            30.toHeight,
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.buttonsAndNav,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.buttonsAndNav.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  buttonText ?? S.current.tryAgain,
                  style: AppTextStyles.font15GreenW500.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms)
                .scale(begin: Offset(0.8, 0.8), end: Offset(1.0, 1.0)),
          ],
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    Widget imageWidget;

    if (imagePath != null) {
      imageWidget = CustomImageView(
        imagePath: imagePath!,
        width: imageSize?.w ?? 100.w,
        height: imageSize?.h ?? 100.h,
        fit: BoxFit.contain,
      );
    } else if (svgPath != null) {
      imageWidget = CustomImageView(
        svgPath: svgPath!,
        width: imageSize?.w ?? 100.w,
        height: imageSize?.h ?? 100.h,
        color: AppColors.typographyLowOpacity,
      );
    } else if (icon != null) {
      imageWidget = Icon(
        icon!,
        size: imageSize?.w ?? 80.w,
        color: AppColors.typographyLowOpacity,
      );
    } else {
      // Default empty illustration
      imageWidget = Container(
        width: imageSize?.w ?? 100.w,
        height: imageSize?.h ?? 100.h,
        decoration: BoxDecoration(
          color: AppColors.gradientBackground.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.typographyLowOpacity.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Icon(
          Icons.inbox_outlined,
          size: (imageSize?.w ?? 100.w) * 0.6,
          color: AppColors.typographyLowOpacity,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: imageWidget,
    )
        .animate()
        .fadeIn(duration: 800.ms)
        .scale(begin: Offset(0.8, 0.8), end: Offset(1.0, 1.0))
        .then()
        .shimmer(
            duration: 2000.ms, color: AppColors.buttonsAndNav.withOpacity(0.1));
  }
}

// Legacy EmptyWidget for backward compatibility
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomEmptyWidget.noData();
  }
}
