import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'core/services/service_locator/service_locator.dart';
import 'nerutum_app.dart';
import 'observers/bloc_oserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObservers();
  ServiceLocator.init();
  runApp(const NeroTumApp());
}

