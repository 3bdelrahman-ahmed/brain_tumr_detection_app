import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/data/local_services/hive_caching_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator/service_locator.dart';
import 'firebase_options.dart';
import 'foundations/app_constants.dart';
import 'nerutum_app.dart';
import 'observers/bloc_oserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveCachingHelper.initHive();
  await AppConstants.getLanguage();
  startService();
  Bloc.observer = BlocObservers();
  runApp(NeroTumApp());
}
