import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeModelView extends GetxController {
  String title = 'پرونده های من';
  int _counter = 0;
  int get counter => _counter;
  TextEditingController txtController = TextEditingController();
  void incrementCounter() {
    _counter++;
    update();
  }

  int currentItem = 1;
  updateItem(index) {
    currentItem = index;
    update();
  }

  dev() => Get.snackbar('', ' ... developping');
}
