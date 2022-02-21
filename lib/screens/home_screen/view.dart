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
  // For bottom navigator
  final List<Widget> _pages = const [HomeAddList(), EmptyListDisplay3()];
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
          controller: _pageController),
      //  Consumer<HomeRouteNotifier>(
      //     builder: (_, notifier, __) => homeScreenMapper(notifier.homeRoute)),
      bottomSheet: DefaultBottomNavigationBar(
        onTap: (index) {
          if (index != 1) {
            // Provider.of<HomeRouteNotifier>(context, listen: false)
            //     .changeHomeRoute(index);
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          } else {
            // navigate to new page
          }
        },
      ),
    );
  }
}
