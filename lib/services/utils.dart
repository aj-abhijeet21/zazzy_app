import 'package:flutter/material.dart';

Color lightOrange = const Color(0xFFff7404);
Color darkOrange = const Color(0xFFff4800);
// String apiKey = 'XFQECT72BA7ZBZQTVHH2ZZZ87';
String apiKey = 'M8R5BLGHFDK99YTS8FE7VNK4T';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.black87,
      margin: const EdgeInsets.only(
        bottom: 30,
        left: 20,
        right: 20,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
