import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view/widgets/view_patient_row.dart';
import 'package:flutter/material.dart';

class ViewPatientsScreen extends StatelessWidget {
  const ViewPatientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                    (context, index) {
                  return ViewPatientRow();
                },
              ))
        ],
      ),
    );
  }
}
