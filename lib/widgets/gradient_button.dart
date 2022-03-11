import 'package:flutter/material.dart';
import 'package:zazzy_app/services/utils.dart';

Widget GradientButton({
  required String title,
  required VoidCallback onClick,
}) {
  Color buttonColor = darkOrange;

  return GestureDetector(
    onTap: onClick,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        // color: buttonColor,
        gradient: LinearGradient(
          colors: [lightOrange, darkOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
