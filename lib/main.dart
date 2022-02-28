import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhg_layout/providers/providers.dart';
import 'package:nhg_layout/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    StreamProvider<ConnectivityResult>(
        create: (_) => NetworkProvider()
            .networkStatusController
            .stream, // so that ConnectivityResult is obtained from stream
        initialData: ConnectivityResult.wifi)
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return Consumer<ConnectivityResult>(
      // initialization of network provider is done here
      builder: (_, value, __) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          // navigatorKey: Globals.navigatorKey, //for navigation service, cleaner code
          title: 'NHG Management System',
          theme: Provider.of<ThemeNotifier>(context).theme,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteList.initialScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),

        // builder: () => Consumer<ConnectivityResult>(builder: (_, value, __) {
        //   if (value == ConnectivityResult.none) {
        //     return const MaterialApp(
        //         debugShowCheckedModeBanner: false, home: ErrorScreen());
        //   } else {
        //     return MaterialApp(
        //       // navigatorKey: Globals.navigatorKey, //for navigation service, cleaner code
        //       title: 'NHG Management System',
        //       theme: Provider.of<ThemeNotifier>(context).theme,
        //       debugShowCheckedModeBanner: false,
        //       initialRoute: RouteList.initialScreen,
        //       onGenerateRoute: RouteGenerator.generateRoute,
        //     );
        //   }
        // }),
      ),
    );
  }
}
