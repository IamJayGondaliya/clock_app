import 'package:flutter/material.dart';

Widget clockOptionTile({
  required String title,
  required bool val,
  required Function(bool) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Switch(
          value: val,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}
