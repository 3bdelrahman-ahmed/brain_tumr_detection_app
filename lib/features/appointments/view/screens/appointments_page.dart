import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/features/appointments/view/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/custom_sliver_search_bar.dart';
import '../../../../core/utils/theme/text_styles/app_text_styles.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomWelcomeAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                child: DoctorCardAppointment(),
              );
            },
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom:80.h)),
      ],
    );
  }
}
