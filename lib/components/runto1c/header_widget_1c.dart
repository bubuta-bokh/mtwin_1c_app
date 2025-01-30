import 'package:flutter/material.dart';

Widget headerWidget1C(int param1C) {
  var stringToDisplay = '';
  switch (param1C) {
    case 0:
      stringToDisplay =
          'Не выбрано действие. Выберите нужный пункт в меню слева.';
      break;
    case 1:
      stringToDisplay = 'Выбраны открытия займов за период.';
      break;
  }
  return Text(stringToDisplay);
}
