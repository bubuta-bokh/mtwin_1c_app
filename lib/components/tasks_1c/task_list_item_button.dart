import 'package:flutter/material.dart';

Widget taskListItemButton(int itemId) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.play_arrow_rounded),
          iconSize: 30,
          color: Colors.lightGreen[200]),
    ],
  );
}
