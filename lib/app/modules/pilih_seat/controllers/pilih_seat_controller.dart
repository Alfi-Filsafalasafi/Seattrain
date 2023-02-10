import 'package:get/get.dart';

class PilihSeatController extends GetxController {
  var indexGerbong = 0.obs;
  var indexKursi = 0.obs;

  void reset() {
    gerbong.forEach((element) {
      element.forEach((element) {
        if (element["status"] != "filled") {
          element.update("status", (value) => "available");
        }
      });
    });
  }

  void gantiGerbong(int indexGerbongTerpilih) {
    indexGerbong.value = indexGerbongTerpilih;
    gerbong.refresh();
  }

  void selectKursi(int indexKursiTerpilih) {
    if (gerbong[indexGerbong.value][indexKursiTerpilih]["status"] ==
        "available") {
      reset();
      gerbong[indexGerbong.value][indexKursiTerpilih]
          .update("status", (value) => "selected");
    }
    gerbong.refresh();
  }

  var gerbong = List.generate(
    6,
    (indexG) => List<Map<String, dynamic>>.generate(
      75,
      (indexK) {
        if (indexG == 0) {
          if (indexK >= 24 && indexK <= 29 || indexK >= 6 && indexK <= 8) {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "available",
            };
          }
        } else if (indexG == 1) {
          if (indexK >= 1 && indexK <= 4 || indexK >= 10 && indexK <= 11) {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "available",
            };
          }
        } else {
          return {
            "id": "ID-${indexG + 1}-${indexK + 1}",
            "status": "available",
          };
        }
      },
    ),
  ).obs;
}
