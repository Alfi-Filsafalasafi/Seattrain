import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pilih_seat_controller.dart';

class PilihSeatView extends GetView<PilihSeatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/bg.png"),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: 100,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Your\nSeat",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF333E63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Computer Line (A)",
                          style: TextStyle(),
                        ),
                        Text(
                          "Lasafi 1 - 3A",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF656CEE),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemStatus(
                        status: "Available",
                        warna: Colors.white,
                      ),
                      itemStatus(
                        status: "Filled",
                        warna: Color(0xFFFF882D),
                      ),
                      itemStatus(
                        status: "Selected",
                        warna: Color(0xFF656CEE),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wagon",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "A",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "D",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "E",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.gerbong.length,
                                        (index) => GestureDetector(
                                          onTap: () =>
                                              controller.gantiGerbong(index),
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            height: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black26,
                                              ),
                                              color: controller
                                                          .indexGerbong.value ==
                                                      index
                                                  ? Color(0xFF656CEE)
                                                  : Color(0xFFFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.green,
                                  child: Obx(
                                    () => GridView.builder(
                                      padding: EdgeInsets.all(10),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 5,
                                      ),
                                      itemCount: controller
                                          .gerbong[
                                              controller.indexGerbong.value]
                                          .length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () =>
                                            controller.selectKursi(index),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: controller.gerbong[controller
                                                            .indexGerbong.value]
                                                        [index]["status"] ==
                                                    "available"
                                                ? Colors.white
                                                : controller.gerbong[controller
                                                                .indexGerbong
                                                                .value][index]
                                                            ["status"] ==
                                                        "selected"
                                                    ? Color(0xFF656CEE)
                                                    : Color(0xFFFF882D),
                                            border: Border.all(
                                              color: Colors.black38,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                // color: Colors.blue,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SELECT YOUR SEAT"),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF656CEE),
                        fixedSize: Size(Get.width * 0.75, 45)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class itemStatus extends StatelessWidget {
  const itemStatus({
    Key? key,
    required this.status,
    required this.warna,
  }) : super(key: key);

  final String status;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: warna,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      SizedBox(
        width: 7,
      ),
      Text(
        status,
        style: TextStyle(
          fontSize: 18,
        ),
      )
    ]);
  }
}
