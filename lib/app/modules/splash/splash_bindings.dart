import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}