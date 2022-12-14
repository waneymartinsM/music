import 'package:get/get.dart';
import 'package:music_flutter/controller/root_controller.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}