import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_sliver_search_bar.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/doctor_card_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/strings/app_string.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  late final ScrollController _scrollController;
  late final AppCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppCubit>();
    _cubit.getDoctorsClinics(reset: true);
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // when we're within 200px of the bottom, try to load more
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _cubit.getDoctorsClinics(reset: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final items = _cubit.doctorsList;
          final isLoading =
              state is GetDoctorsClinicsLoading && !state.isPaging;
          final isLoadingMore =
              state is GetDoctorsClinicsLoading && state.isPaging;

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              CustomWelcomeAppBar(),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverSearchBar(
                  suffixIcon: AssetsSvg.cancel,
                      controller: _cubit.searchController,
                  AppStrings.searchForTherapist),
              ),
              if (isLoading)
                SliverFillRemaining(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (ctx, i) {
                      return CustomAppShimmer(
                        height: 150.h,
                      ).paddingOnly(top: 13.h, left: 16.w, right: 16.w);
                    },
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                      return DoctorCardDoctors(
                        doctor: items[i],
                      ).paddingOnly(top: 10.h, left: 16.w, right: 16.w);
                    },
                    childCount: items.length,
                  ),
                ),
                if(items.isEmpty)
                  SliverFillRemaining(
                  child: CustomEmptyWidget.doctors()
                ),
              if (isLoadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: CustomAppShimmer(
                      height: 150.h,
                    ),
                  ),
                ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 65.h)),
            ],
          );
        },
      ),
    );
  }
}
