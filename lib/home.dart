import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toilet_app/getx/my_getx_controller.dart';
import 'package:toilet_app/utils/dialog_body.dart';
import 'package:toilet_app/utils/mycolors.dart';
import 'package:toilet_app/utils/padding.dart';
import 'package:toilet_app/utils/text.dart';
import 'package:toilet_app/widget/button_custom.dart';
import 'package:toilet_app/widget/item.dart';
import 'package:toilet_app/widget/item_star.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerGetx = Get.put(MyGetXController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double height_item = 125.0;
    final double width_item = 150.0;
    final double padding_item = 64.0;
    final double padding08 = 8.0;
    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //part 1: body
          Container(
              height: height * 4 / 5,
              alignment: Alignment.center,
              width: width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  mainItem(
                      height: height,
                      width: width,
                      height_item: height_item,
                      width_item: width_item,
                      padding_item: padding_item),
                  tempItem(
                      height: height, width: 115.0, humid: 55, tempurature: 28),
                  Obx(() => Visibility(
                        visible: controllerGetx.visible.value,
                        child: dialogBody(
                            height: height,
                            width: width,
                            controller_getx: controllerGetx),
                      ))
                ],
              )),
          //part 2 : star
          Container(
              color: MyColor.white,
              height: height * 1 / 5,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text_custom(
                      text: 'Help us improve our service',
                      color: MyColor.black_text,
                      weight: FontWeight.w500,
                      size: TextSizeDefault.text28),
                  const SizedBox(
                    height: PaddingDefault.pading08,
                  ),
                  rowStar(
                      controllerGetx: controllerGetx,
                      onPress: () {
                        print('open dialog');
                        controllerGetx.toggleVisible();
                        controllerGetx.startCountdown();
                      })
                ],
              )),
        ],
      ),
    ));
  }
}
