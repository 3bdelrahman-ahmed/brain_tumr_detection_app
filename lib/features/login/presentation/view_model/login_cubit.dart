import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../../../core/utils/extenstions/navigation_extenstions.dart';
import '../../../../core/data/local_services/app_caching_helper.dart';
import '../../data/models/login_model.dart';
import '../../data/repository/login_repository.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitial());
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final LocalAuthentication auth = LocalAuthentication();
  bool rememberMe = false;
  bool isBiometricAvailable = false;
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;

  Future<void> forgetPassword() async {
    final response =
        await repository.forgetPassword(forgetPasswordController.text);
    response.fold((l) {
      l.message!.showToast();
    }, (r) {
      context.navigateTo(
        AppRoutes.verificationCodeScreen,
        arguments: {
          'email': r,
          'isResetPass': true,
        },
      );
    });
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final result = await repository.login(
        LoginRequestModel(
            email: emailController.text, password: passwordController.text),
      );
      result.fold((l) {
        l.message!.showToast();
        emit(LoginErrorState());
      }, (r) async {
        if (rememberMe) {
          AppConstants.setBiometricToken(r.token!);
          AppConstants.setBiometricUser(r.user!);
        }
        AppConstants.cacheString(
            key: AppCacheHelper.rememberMe, value: rememberMe.toString());
        AppConstants.setToken(r.token!);
        AppConstants.setUser(r.user!);
        AppConstants.user = r.user;
        await setLocation();
        context.navigateTo(AppRoutes.homeScreen);
        emit(LoginSuccessState());
      });
    }
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState(rememberMe: rememberMe));
  }

  Future<void> checkBiometricAvailability() async {
    try {
      isBiometricAvailable = await auth.canCheckBiometrics;
      emit(BiometricAvailabilityState(
          isBiometricAvailable: isBiometricAvailable));
    } catch (e) {
      isBiometricAvailable = false;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      // Retrieve user token and data from secure storage
      String? userToken = await AppConstants.getBiometricToken();
      User? userDataJson = await AppConstants.getBiometricUser();

      if (userToken == null || userDataJson == null) {
        emit(LoginErrorState());
        return;
      }

      bool authenticated = await auth.authenticate(
        localizedReason: 'welcome back ${userDataJson.fullName}',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          sensitiveTransaction: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        await AppConstants.setToken(userToken);
        await AppConstants.setUser(userDataJson);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.homeScreen, (_) => false);
        emit(LoginSuccessState());
      }
    } catch (e) {
      emit(LoginErrorState());
      print("Biometric authentication failed: $e");
    }
  }

  Future<void> setLocation() async {
    final latitude = AppConstants.user?.latitude;
    final longitude = AppConstants.user?.longitude;

    if (latitude == null || longitude == null) {
      // Default coordinates (e.g. Cairo, Egypt)
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(30.033333, 31.233334);
      AppConstants.location =
          "${placeMarks.first.locality} ,${placeMarks.first.country}";
    } else if (longitude >= 90 && latitude >= 90) {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(30.033333, 31.233334);
      AppConstants.location =
          "${placeMarks.first.locality} ,${placeMarks.first.country}";
    } else {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      AppConstants.location =
          "${placeMarks.first.locality} ,${placeMarks.first.country}";
    }
  }

  void changePassword() {
    isObscure = !isObscure;
    emit(ChangePasswordState(isObscure));
  }
}
