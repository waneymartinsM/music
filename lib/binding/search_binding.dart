import 'package:get/get.dart';
import 'package:music_flutter/controller/search_controller.dart';

class SearchBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}