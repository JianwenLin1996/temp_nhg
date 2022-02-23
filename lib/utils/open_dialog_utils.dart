import 'package:flutter/material.dart';
import 'package:nhg_layout/screens/add_new_item_screen/widget.dart/add_new_item_dialog.dart';
import 'package:nhg_layout/screens/complete_collection_dialog/view.dart';
import 'package:nhg_layout/screens/completed_dialog/view.dart';

void onAddNewItemPressed(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AddNewItemDialog());
}

void onCollectedBackPressed(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CompleteCollectionDialog());
}

void onCompletedPressed(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CompletedDialog());
}
