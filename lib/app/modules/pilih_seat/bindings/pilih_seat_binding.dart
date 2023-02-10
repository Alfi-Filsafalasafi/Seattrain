import 'package:get/get.dart';

import '../controllers/pilih_seat_controller.dart';

class PilihSeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihSeatController>(
      () => PilihSeatController(),
    );
  }
}
