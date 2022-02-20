import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';

class HomeAddList extends StatefulWidget {
  const HomeAddList({Key? key}) : super(key: key);

  @override
  State<HomeAddList> createState() => _HomeAddListState();
}

class _HomeAddListState extends State<HomeAddList> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('disposing page');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.3],
                  colors: Styles.emptyBackgroundColor)),
          child: Center(
            child: EmptyListDisplay(),
          ),
        ))
      ],
    );
  }
}
