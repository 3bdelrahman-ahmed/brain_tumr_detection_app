import 'package:bloc/bloc.dart';
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
  await AppConstants.getLanguage(); // Detect Language BEFORE runApp
  startService();
  Bloc.observer = BlocObservers();
  runApp(NeroTumApp());
}
