import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toilet_app/api/firebase_api_service.dart';
import 'package:toilet_app/body_toilet_page.dart';
import 'package:toilet_app/getx/my_getx_controller.dart';
import 'package:toilet_app/main.dart';
import 'package:toilet_app/utils/dialog_body.dart';
import 'package:toilet_app/utils/dialog_page.dart';
import 'package:toilet_app/utils/mycolors.dart';
import 'package:toilet_app/utils/mystring.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                  // mainItem(
                  //     height: height,
                  //     width: width,
                  //     height_item: height_item,
                  //     width_item: width_item,
                  //     padding_item: padding_item),
                  BodyToiletPage(),

                  Obx(() => Visibility(
                      visible: controllerGetx.visible.value,
                      child:
                          //  dialogBody(
                          //     height: height,
                          //     width: width,
                          //     controller_getx: controllerGetx),
                          DialogPage()))
                ],
              )),
          //part 2 : star
          Container(
              color: MyColor.white,
              height: height * .9 / 5,
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
                        // controllerGetx.toggleVisible();
                        // controllerGetx.startCountdown();
                        controllerGetx.turnOnVisible();
                      })
                ],
              )),
        ],
      ),
    ));
  }
}

class FirebaseDataController {
  final StreamController<Map<String, dynamic>> _dataStreamController =
      StreamController<Map<String, dynamic>>.broadcast();

  late final DatabaseReference _databaseRef;

  FirebaseDataController() {
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      name: MyString.FIREBASE_APP_NAME,
      options: FirebaseOptions(
        apiKey: MyString.FIREBASE_apiKey,
        appId: MyString.FIREBASE_appId,
        messagingSenderId: MyString.FIREBASE_messagingSenderId,
        projectId: MyString.FIREBASE_projectId,
      ),
    );

    _databaseRef = FirebaseDatabase(
      app: Firebase.app(MyString.FIREBASE_APP_NAME),
      databaseURL: MyString.FIREBASE_url,
    ).reference().child('roomMen');

    _databaseRef.onValue.listen((event) {
      final model = (event.snapshot.value as Map<dynamic, dynamic>?)
              ?.cast<String, dynamic>() ??
          {};
      // final model = event.snapshot.value as Map<String, dynamic>? ?? {};
      _dataStreamController.add(model);
    });
  }

  Stream<Map<String, dynamic>> get dataStream => _dataStreamController.stream;

  void dispose() {
    _dataStreamController.close();
  }
}
