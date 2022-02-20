import 'package:flutter/material.dart';
import 'package:nhg_layout/screens/home_screen/widget/home_add_list.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';

Widget homeScreenMapper(int index) {
  switch (index) {
    case 0:
      return const HomeAddList();
    case 2:
      return const EmptyListDisplay2();
    default:
      return const EmptyListDisplay3();
  }
}
