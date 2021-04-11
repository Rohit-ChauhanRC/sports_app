import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/app/data/api_helper.dart';
import 'package:template/app/data/interface_controller/api_interface_controller.dart';

class Initializer {
  static void init() {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initStorage();

      _initScreenPreference();
      _initApis();
    } catch (err) {
      rethrow;
    }
  }

  static void _initApis() {
    Get.put<ApiHelper>(
      ApiHelper(),
    );

    Get.put<ApiInterfaceController>(
      ApiInterfaceController(),
    );
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
