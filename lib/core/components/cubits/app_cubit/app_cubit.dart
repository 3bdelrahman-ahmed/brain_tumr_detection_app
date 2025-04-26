import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../foundations/app_constants.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void changeLanguage(bool lang) {
    AppConstants.setLanguage(lang);
    emit(ChangeLanguage());
  }
}
