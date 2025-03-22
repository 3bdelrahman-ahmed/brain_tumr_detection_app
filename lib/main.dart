import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/components/cubits/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator/service_locator.dart';
import 'nerutum_app.dart';
import 'observers/bloc_oserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  startService();
  Bloc.observer = BlocObservers();
  runApp(NeroTumApp());
}

