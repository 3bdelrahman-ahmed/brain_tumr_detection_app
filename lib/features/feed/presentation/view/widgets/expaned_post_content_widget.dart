import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class ExpandablePostText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const ExpandablePostText({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  @override
  _ExpandablePostTextState createState() => _ExpandablePostTextState();
}

class _ExpandablePostTextState extends State<ExpandablePostText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text, style: widget.style);
    final tp = TextPainter(
      text: span,
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 20); // 10.w padding

    final isOverflowing = tp.didExceedMaxLines;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            textAlign: TextAlign.center,
            maxLines: _expanded ? null : 3,
            overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: widget.style.copyWith(fontSize: 16.sp),
          ),
          if (isOverflowing)
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  _expanded ? S.of(context).readLess : S.of(context).readMore,
                  style: widget.style.copyWith(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
