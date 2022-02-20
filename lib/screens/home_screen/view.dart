import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color appThemeColor =
        Provider.of<ThemeNotifier>(context).theme.primaryColor;
    return Scaffold(
      bottomNavigationBar: null,
      appBar: DefaultAppBar(
        titleText: AppStrings.myItem,
        actionIcons: const [
          AppBarActionIcon(icon: Icons.notifications_none_rounded),
          AppBarActionIcon(
            icon: Icons.history_rounded,
          )
        ],
      ),
      body: Column(
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
              child: EmptyListDisplay(),
            ),
          ))
        ],
      ),
      // bottomSheet: BottomNavigationBar(items: []),
    );
  }
}
