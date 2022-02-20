import 'package:flutter/material.dart';
import 'package:nhg_layout/constants/constants.dart';
import 'package:nhg_layout/constants/styles.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/screens/home_screen/widget/widget.dart';
import 'package:nhg_layout/utils/home_screen_mapper.dart';
import 'package:nhg_layout/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
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
      body: homeScreenMapper(currentIndex),
      bottomSheet: DefaultBottomNavigationBar(
        onTap: (index) {
          if (index != 1) {
            setState(() {
              currentIndex = index;
            });
          } else {
            // navigate to new page
          }
        },
      ),
    );
  }
}
