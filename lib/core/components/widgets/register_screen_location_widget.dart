import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/custom_location_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubits/location_cubit/location_cubit.dart';

class LocationMapScreen extends StatefulWidget {
  @override
  _LocationMapScreenState createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomLocationAppBar().alignTop(),
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Container(
                width: 350.w,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is LocationLoaded) {
              return Container(
                child: GoogleMap(
                  initialCameraPosition: state.cameraPosition,
                  markers: {state.marker},
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  onCameraMove:(CameraPosition position) {
                    context
                        .read<LocationCubit>()
                        .updateLocation(position.target);
                  },
                ),
              ).paddingOnly(bottom: 85.h, top: 70.h);
            }
            return Center(
              child: Text("Choose Location in Other Time"),
            );
          },
        ),
        CustomButton(text: AppStrings.next, onTap: () {})
            .alignBottom()
            .paddingOnly(bottom: 20.h),
      ],
    );
  }
}
