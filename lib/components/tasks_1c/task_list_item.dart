import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget taskListItem(
    int itemNumber, String itemName, String itemComment, BuildContext ctx) {
  return ListTile(
    leading: Text(
      '$itemNumber',
      style: const TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black26),
    ),
    title: Text(itemName),
    subtitle: Text(itemComment),
    trailing: IconButton(
      onPressed: () => ctx.goNamed("executetask",
          pathParameters: {'taskId': itemNumber.toString()}),
      icon: const Icon(Icons.play_arrow_rounded),
      iconSize: 30,
      color: Colors.black45,
    ),
  );
}
