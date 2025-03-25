import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class StarsGenerator extends StatelessWidget {
  final double rating;

  const StarsGenerator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating.floor()
                  ? Icons.star
                  : index < rating
                      ? Icons.star_half
                      : Icons.star_border,
              color: Colors.amber,
              size: 18.w,
            );
          }),
        ),
        5.toWidth,
        Text("${rating}",style: AppTextStyles.font12LightGreenW500,)
      ],
    );
  }
}
