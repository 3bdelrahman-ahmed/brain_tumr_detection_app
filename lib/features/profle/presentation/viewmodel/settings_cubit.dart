import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
