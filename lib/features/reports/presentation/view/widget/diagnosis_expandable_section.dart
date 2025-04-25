import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'diagnosis_container.dart';

class DiagnosisExpandableSection extends StatefulWidget {
  @override
  State<DiagnosisExpandableSection> createState() => _DiagnosisExpandableSectionState();
}

class _DiagnosisExpandableSectionState extends State<DiagnosisExpandableSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).diagnosis, style: AppTextStyles.font16BlueW700),
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppColors.buttonsAndNav,
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: Container(),
          secondChild: Column(
            children: [
              10.toHeight,
              DiagnosisContainer(
                head: S.of(context).result,
                diagnosis: S.of(context).firstDiagnosisContainer,
              ),
              DiagnosisContainer(
                head: S.of(context).findings,
                diagnosis: S.of(context).secondDiagnosisContainer,
              ),
              DiagnosisContainer(
                head: S.of(context).reasoning,
                diagnosis: S.of(context).thirdDiagnosisContainer,
              ),
            ],
          ),
          crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ],
    ).paddingSymmetric(vertical: 20.h, horizontal: 20.w);
  }
}
