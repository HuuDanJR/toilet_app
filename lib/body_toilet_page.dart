import 'package:flutter/material.dart';
import 'package:toilet_app/home.dart';
import 'package:toilet_app/widget/item.dart';

class BodyToiletPage extends StatelessWidget {
  BodyToiletPage({super.key});
  final FirebaseDataController _firebaseDataController =
      FirebaseDataController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final double height_item = 125.0;
    final double width_item = 150.0;
    final double padding_item = 64.0;
    final double padding08 = 8.0;
    return StreamBuilder<Map<String, dynamic>>(
      stream: _firebaseDataController.dataStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!;
          print('$data');
          final onOffMen2Value = data['OnOffMen2'];
          final onOffMen1Value = data['OnOffMen1'];
          final onOffWomanValue = data['OnOffWoman'];
          final temp = data['Temp'];
          final hum = data['Hum'];
          //LOGIN => false mean AVAILABLE and true mean UN-AVAILABLE

          return Stack(
            alignment: Alignment.center,
            children: [
              mainItem(
                  isUseMen1: onOffMen1Value == 1
                      ? false
                      : onOffMen1Value == 0
                          ? true
                          : null,
                  isUseMen2: onOffMen2Value == 1
                      ? false
                      : onOffMen2Value == 0
                          ? true
                          : null,
                  isUseWoman1: onOffWomanValue == 1
                      ? false
                      : onOffWomanValue == 0
                          ? true
                          : null,
                  width: width,
                  height: height,
                  height_item: height_item,
                  width_item: width_item,
                  padding_item: padding_item),
              tempItem(
                  height: height,
                  width: 115.0,
                  humid:hum==null ? '30' : '$hum',
                  tempurature:temp==null ? '50' : '$temp'),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('An error occurred');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
