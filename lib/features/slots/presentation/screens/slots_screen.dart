import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:flutter/material.dart';

class SlotsScreen extends StatelessWidget {
  const SlotsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),

        ],
      ),
    );
  }
}
