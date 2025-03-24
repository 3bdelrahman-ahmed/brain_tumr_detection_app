import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_sliver_search_bar.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/doctor_card_doctors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/string/app_string.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverPersistentHeader(
            pinned: true,
              delegate:CustomSliverSearchBar(AppStrings.searchForTherapist)),
          SliverList(delegate: SliverChildBuilderDelegate(
            addAutomaticKeepAlives: true,
            (context, index) {
              return DoctorCardDoctors().paddingOnly(top: 13.h, left: 20.w, right: 20.w);
            },
            childCount: 5
          ))
        ],
      ),
    );
  }
}
