import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'cached_models/clinics_model.dart';

class HiveCachingHelper {
  static final HiveCachingHelper _instance = HiveCachingHelper._internal();

  factory HiveCachingHelper() => _instance;

  HiveCachingHelper._internal();

  static const String _clinicBox = 'clinicsBox';

  static Box<List<Clinic>>? _clinicBoxInstance;

  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    if (!Hive.isAdapterRegistered(ClinicAdapter().typeId)) {
      Hive.registerAdapter(ClinicAdapter());
    } // // Optionally open boxes during initialization if always needed
  }

  Future<Box<List<Clinic>>> getClinicBox() async {
    _clinicBoxInstance ??= await Hive.openBox<List<Clinic>>(_clinicBox);
    return _clinicBoxInstance!;
  }

  static Future<void> saveClinics(List<Clinic> clinics) async {
    print('Saved ${clinics.length} clinics to Hive');

    final box = await Hive.openBox(_clinicBox); 
    await box.put('clinics_list', clinics.map((e) => e).toList());
  }

  static Future<List<Clinic>> getClinics() async {
    final box = await Hive.openBox(_clinicBox);
    final rawList = box.get('clinics_list', defaultValue: []);
    if (rawList == null) return [];
    return List<Clinic>.from(rawList as List);
  }

  static Future<void> clearClinics() async {
    final box = await Hive.openBox(_clinicBox);
    await box.clear();
  }
}
