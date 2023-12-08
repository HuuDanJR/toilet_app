import 'package:flutter/material.dart';
import 'package:toilet_app/utils/mycolors.dart';
import 'package:toilet_app/widget/button_custom.dart';

Widget starLineItem({int? index, bool? isActive = false, onPress}) {
  return customPressButton(
      padding: 64,
      onPress: () {
        // print('choose $index');
        onPress();
      },
      child: Icon(Icons.star,
          color: isActive == false ? MyColor.greyBG : MyColor.yellowBG,
          size: 72));
}
