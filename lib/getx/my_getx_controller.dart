import 'dart:async';

import 'package:get/get.dart';
import 'package:toilet_app/model/model_toilet.dart';

class MyGetXController extends GetxController {
  RxBool star1 = false.obs;
  RxBool star2 = false.obs;
  RxBool star3 = false.obs;
  RxBool star4 = false.obs;
  RxBool star5 = false.obs;
  RxString starText = ''.obs;
  RxInt starCount = 0.obs;

  RxBool visible = false.obs;

  RxList<String> selectedItemNames =
      <String>[].obs; // New RxList for selected item names

  RxInt count = 0.obs;
  RxBool countdownFinished = false.obs;

  Timer? countdownTimer;

  @override
  void onClose() {
    // Cancel the countdown timer when the controller is closed
    countdownTimer?.cancel();
    super.onClose();
  }

  void resetCountdown(Function? onCountdownFinished) {
    // Reset the countdown values and cancel the timer
    count.value = 10;
    countdownFinished.value = false;
    countdownTimer?.cancel();

    // Restart the countdown
    startCountdown(
      onCountdownFinished
    );
  }

  void startCountdown(Function? onCountdownFinished) {
    count.value = 10; // Set the initial value to 10

    // Start the countdown timer
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count.value > 0) {
        // Decrement count by 1 every second
        count.value--;
      } else {
        // Stop the timer when count reaches 0
        timer.cancel();

        // Set the countdownFinished flag to true
        countdownFinished.value = true;
        // Execute the callback function if provided
        if (onCountdownFinished != null) {
          onCountdownFinished();
        }
      }
    });
  }

  void toggleVisible() {
    visible.toggle();
  }

  void turnOnVisible() {
    visible.value = true;
  }

  void turnOff() {
    // Set the value of 'visible' to false
    visible.value = false;
    // Update the UI reactively
    update();
  }

  var items = <ToiletItem>[
    ToiletItem(
        name: "No toilet paper",
        image: "assets/asset2.png",
        id: 1,
        isSelect: false),
    ToiletItem(
        name: "Dirty toilet bowl",
        image: "assets/asset5.png",
        id: 2,
        isSelect: false),
    ToiletItem(
        name: "Dirty basin",
        image: "assets/asset4.png",
        id: 3,
        isSelect: false),
    ToiletItem(
        name: "Wet floor", image: "assets/asset7.png", id: 4, isSelect: false),
    ToiletItem(
        name: "Faulty equipment",
        image: "assets/asset3.png",
        id: 5,
        isSelect: false),
    ToiletItem(
        name: "Full trash bin",
        image: "assets/asset8.png",
        id: 6,
        isSelect: false),
    ToiletItem(
        name: "Foul smell", image: "assets/asset1.png", id: 7, isSelect: false),
    ToiletItem(
        name: "Dirty floor",
        image: "assets/asset6.png",
        id: 8,
        isSelect: false),
  ].obs;

  void toggleSelection({int? index,Function? function}) {
    ToiletItem currentItem = items[index!];
    items[index!] = currentItem.copyWith(isSelect: !currentItem.isSelect);

    if (currentItem.isSelect) {
      // If the item is deselected, remove its name from the RxList

      selectedItemNames.remove(currentItem.name);
      resetCountdown(function);
    } else {
      // If the item is selected, add its name to the RxList

      selectedItemNames.add(currentItem.name);
      resetCountdown(function);
    }
  }

  //reset all toilet Item's  isSelected.value = false ;
  void resetToiletItemsSelection() {
    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].copyWith(isSelect: false);
    }
  }

  resetForm() {
    star1.value = false;
    star2.value = false;
    star3.value = false;
    star4.value = false;
    star5.value = false;

    starCount.value = 0;
    visible.value = false;
    countdownTimer!.cancel();
    resetToiletItemsSelection();
    update();
  }

  changeStarState(index) {
    if (index == 1) {
      starCount.value = 1;
      star1.value = true;
      starText.value = 'BAD';
      if (star2.value = true) {
        star2.value = false;
      }
      if (star3.value = true) {
        star3.value = false;
      }
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }
    } else if (index == 2) {
      starCount.value = 2;
      star1.value = true;
      star2.value = true;
      starText.value = 'BAD';
      if (star3.value = true) {
        star3.value = false;
      }
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }
    } else if (index == 3) {
      starCount.value = 3;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      starText.value = 'GOOD';
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }
    } else if (index == 4) {
      starCount.value = 4;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      star4.value = true;
      if (star5.value = true) {
        star5.value = false;
      }
      starText.value = 'GOOD';
    } else if (index == 5) {
      starCount.value = 5;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      star4.value = true;
      star5.value = true;
      starText.value = 'PERFECT';
    }
  }
}
