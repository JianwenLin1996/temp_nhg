import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/screens/home_screen/widget/empty_list_display.dart';

class HomeAddList extends StatefulWidget {
  const HomeAddList({Key? key}) : super(key: key);

  @override
  State<HomeAddList> createState() => _HomeAddListState();
}

class _HomeAddListState extends State<HomeAddList>
    with AutomaticKeepAliveClientMixin<HomeAddList> {
  int test = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('why initiating again');
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              test++;
            });
          },
          child: Text('Addddddd'),
        ),
        Text(test.toString()),
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
