import 'package:flutter/material.dart';

Widget buttonRow({
  required String btnName,
  required Widget button,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(btnName),
        button,
      ],
    ),
  );
}
