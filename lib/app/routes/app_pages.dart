import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pilih_seat/bindings/pilih_seat_binding.dart';
import '../modules/pilih_seat/views/pilih_seat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_SEAT,
      page: () => PilihSeatView(),
      binding: PilihSeatBinding(),
    ),
  ];
}
