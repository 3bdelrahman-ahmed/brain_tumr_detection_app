import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  final String orginalImageUrl;
  final String heroTag;

  const FullScreenImageViewer({
    Key? key,
    required this.imageUrl,
    required this.orginalImageUrl,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: Center(
          child: Hero(
            tag: heroTag,
            child: InteractiveViewer(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the original image in a smaller size
                    Expanded(
                      child: CustomImageView(
                        url: imageUrl,
                        // width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                    12.toWidth,

                    if (orginalImageUrl.isNotEmpty)
                      Expanded(
                        child: CustomImageView(
                          url: orginalImageUrl,
                          // width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
