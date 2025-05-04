import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/custom_location_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../generated/l10n.dart';
import '../cubits/location_cubit/location_cubit.dart';

class LocationMapScreen extends StatefulWidget {
  @override
  _LocationMapScreenState createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.typography,
                ),
              );
            }
            if (state is LocationLoaded) {
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: state.cameraPosition,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    onCameraMove: (CameraPosition position) {
                      _currentLocation = position.target;
                    },
                    onCameraIdle: () {
                      // Update state when user stops moving the map
                      if (_currentLocation != null) {
                        context
                            .read<LocationCubit>()
                            .updateLocation(_currentLocation!);
                      }
                    },
                  ).paddingOnly(top: 70.h),
                  // Floating marker at the center
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 4)
                            ],
                          ),
                          child: Text(
                            state.streetName,
                            style: AppTextStyles.font15GreenW500,
                          ),
                        ),
                        8.toHeight,
                        CustomImageView(
                          svgPath: AssetsSvg.location.toSVG(),
                          height: 40.h,
                          width: 40.h,
                        )
                      ],
                    ).paddingOnly(bottom: 50.h),
                  ),
                  CustomButton(
                    text: S.of(context).confirm,
                    onTap: () {
                      if (_currentLocation != null) {
                        context
                            .read<LocationCubit>()
                            .updateLocation(_currentLocation!);
                        Navigator.pop(context, {
                          "position": state.position,
                          "streetName": state.streetName,
                        });
                      }
                    },
                  ).alignBottom().paddingOnly(bottom: 20.h)
                ],
              );
            }
            return Center(
              child: Text(
                S.of(context).openLocationPermission,
                textAlign: TextAlign.center,
                style: AppTextStyles.font15GreenW500,
              ),
            );
          },
        ),
        CustomLocationAppBar().alignTop(),
      ],
    );
  }
}
