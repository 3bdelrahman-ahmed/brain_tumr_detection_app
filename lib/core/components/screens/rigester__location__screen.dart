import 'package:brain_tumr_detection_app/core/components/screens/register_screen_location_widget.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationMapScreen(),
    );
  }
}
