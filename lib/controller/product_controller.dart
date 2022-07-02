import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
