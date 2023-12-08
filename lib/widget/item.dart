

import 'package:flutter/material.dart';
import 'package:toilet_app/utils/mycolors.dart';
import 'package:toilet_app/utils/padding.dart';
import 'package:toilet_app/utils/text.dart';

Widget tempItem({height, width,tempurature,humid}) {
  return Container(
    width: width,
    height: height * 3 / 5,
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          width:width,height:(height*3/5)/2,
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width / 2),
              topRight: Radius.circular(width / 2),
            ),
            border: Border.all(color: MyColor.yellowBG, width: 1)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/tempurature.png',width: 55,height:55,),
              text_custom(text: '${tempurature}°',size:48,weight: FontWeight.w700,color:MyColor.yellowBG),
            ],
          ),
        ),
        Container(
          width:width,height:(height*3/5)/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/humid.png',width: 55,height:55,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 text_custom(text: '$humid',size:48,weight: FontWeight.w700,color:MyColor.greenBG),
                 text_custom(text:'%',size:24,weight: FontWeight.w700,color:MyColor.greenBG,)
                  
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(width / 2),
              bottomRight: Radius.circular(width / 2),
            ),
            border: Border.all(color: MyColor.yellowBG, width: 1)
          ),
        ),
      ],
    ),
   
  );
}

Widget mainItem({width, height, width_item, height_item, padding_item}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: width / 2,
        height: height * 4 / 5,
        color: MyColor.blueBG,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/man.png',
              width: width_item,
              height: height_item,
            ),
            SizedBox(
              height: padding_item * 1.5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                toiletItem(isUsed: false),
                SizedBox(
                  width: padding_item,
                ),
                toiletItem(isUsed: true),
              ],
            )
          ],
        ),
      ),
      Container(
        width: width / 2,
        height: height * 4 / 5,
        color: MyColor.pinkBG,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/woman.png',
              width: width_item,
              height: height_item,
            ),
            SizedBox(
              height: padding_item * 2,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                toiletItem(isUsed: false),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget toiletItem({isUsed}) {
  return Column(
    children: [
      Container(
        height: 125.0,
        width: 125.0,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                  right: PaddingDefault.padding24,
                  top: PaddingDefault.pading08,
                  child: Image.asset(
                      isUsed == false
                          ? 'assets/check.png'
                          : "assets/check2.png",
                      width: 32.5,
                      height: 32.5)),
              Image.asset(isUsed == false
                  ? 'assets/toilet.png'
                  : "assets/toilet_grey.png"),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: PaddingDefault.pading08,
      ),
      text_custom(
       text: isUsed ==false ? 'VACANT' : 'OCCUPIED',
       color:MyColor.black_text,
       size: TextSizeDefault.text22,
       weight: FontWeight.w500
      ),
      
    ],
  );
}
