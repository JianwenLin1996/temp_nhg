import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 1200), // 20:9, my test device screen ratio
      builder: () => MaterialApp(
        // navigatorKey: Globals.navigatorKey, //for navigation service, cleaner code
        title: 'NHG Management System',
        theme: Provider.of<ThemeNotifier>(context).theme,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteList.homeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
