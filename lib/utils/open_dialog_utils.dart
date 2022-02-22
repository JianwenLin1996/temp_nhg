import 'package:flutter/material.dart';
import 'package:nhg_layout/screens/add_new_item_screen/widget.dart/add_new_item_dialog.dart';
import 'package:nhg_layout/screens/complete_collection_dialog/view.dart';

void onAddNewItemPressed(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AddNewItemDialog());
}

void onCollectedBackPressed(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CompleteCollectionDialog());
}
