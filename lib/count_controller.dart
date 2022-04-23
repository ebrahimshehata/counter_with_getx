import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count += 1;
    update();
  }

  void decrement() {
    count -= 1;
    update();
  }


  void restart() {
    count.value=0 ;
    update();
  }
}
