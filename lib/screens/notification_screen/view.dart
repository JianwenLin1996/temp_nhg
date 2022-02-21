import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/screens/profile_screen/view.dart';
import 'package:nhg_layout/widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3],
                      colors: Styles.emptyBackgroundColor)),
              child: const Center(
                child: Text('Notification'),
              ),
            ))
          ],
        ),
        const DefaultAppBar(
          hasBackButton: true,
          titleText: 'Notification',
          actionIcons: [],
        )
      ],
    ));
  }
}
