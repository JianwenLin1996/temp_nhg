import 'package:flutter/material.dart';

import 'package:nhg_layout/screens/add_new_item_screen/widget/widget.dart';
import 'package:nhg_layout/screens/screens.dart';

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
