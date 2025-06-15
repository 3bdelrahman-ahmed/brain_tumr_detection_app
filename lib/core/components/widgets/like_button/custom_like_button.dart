import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/assets/assets_svg.dart';
import '../../../utils/theme/colors/app_colors.dart';
import '../../../utils/theme/text_styles/app_text_styles.dart';
import '../custom_image_view.dart';
import 'custom_heart_animation_widget.dart';

class LikeButton extends StatefulWidget {
  final bool isLike;
  final double? width;
  final double? height;
  final Color? color;
  final VoidCallback? onPressed;

  const LikeButton({
    super.key,
    required this.isLike,
    this.onPressed,
    this.width,
    this.height,
    this.color,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool _isLike;

  @override
  void initState() {
    super.initState();
    _isLike = widget.isLike;
  }

  void _handleTap() {
    setState(() {
      _isLike = !_isLike;
    });
    widget.onPressed?.call();
  }

  @override
  void didUpdateWidget(covariant LikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLike != widget.isLike) {
      _isLike = widget.isLike;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      // focusColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      // overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: _handleTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            width: 25.w,
            height: 25.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: HeartAnimation(
              isAnimating: _isLike,
              alwaysAnimate: true,
              duration: 150.ms,
              child: CustomImageView(
                svgPath:
                    // _isLike
                    //     ?
                    AssetsSvg.heartIcon.toSVG(),
                // : AssetsSvg.heartIcon.toSVG(),
                color: _isLike ? AppColors.error : widget.color,
                onTap: _handleTap,
              ),
            ),
          ),
          5.toWidth,
          Text(
            S.of(context).like,
            style: AppTextStyles.font12cyanW700,
          )
        ],
      ),
    );
  }
}
