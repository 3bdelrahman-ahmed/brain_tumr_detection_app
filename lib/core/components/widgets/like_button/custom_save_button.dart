import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../generated/l10n.dart';
import '../../../utils/assets/assets_svg.dart';
import '../../../utils/theme/text_styles/app_text_styles.dart';
import '../custom_image_view.dart';
import 'custom_heart_animation_widget.dart';

class CustomSaveButton extends StatefulWidget {
  final bool isSaved;
  final double? width;
  final double? height;
  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  const CustomSaveButton({
    super.key,
    required this.isSaved,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.text,
  });

  @override
  State<CustomSaveButton> createState() => _CustomSaveButtonState();
}

class _CustomSaveButtonState extends State<CustomSaveButton> {
  late bool _isLike;

  @override
  void initState() {
    super.initState();
    _isLike = widget.isSaved;
  }

  void _handleTap() {
    setState(() {
      _isLike = !_isLike;
    });
    widget.onPressed?.call();
  }

  @override
  void didUpdateWidget(covariant CustomSaveButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSaved != widget.isSaved) {
      _isLike = widget.isSaved;
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
                    AssetsSvg.saveIcon.toSVG(),
                // : AssetsSvg.heartIcon.toSVG(),
                color: _isLike ? Colors.amber : widget.color,
                onTap: _handleTap,
              ),
            ),
          ),
          5.toWidth,
          Text(
         widget.text??   S.of(context).like,
            style: AppTextStyles.font12cyanW700,
          )
        ],
      ),
    );
  }
}
