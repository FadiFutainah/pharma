import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'Common/routes.dart';
import 'Common/themes.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'Providers/CartProvider.dart';
import 'View/Pages/Admin/AddNewAdminPage.dart';
import 'View/Pages/Admin/SignedUsersPage.dart';
import 'View/Pages/Home/AdminHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: GetMaterialApp(
        home: AnimatedSplashScreen(
          duration: 50,
          splash: Image.asset(
            'images/Intro.png',
          ),
          splashIconSize: 150,
          // splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: SignedUsersPage(),
        ),
        theme: primaryTheme,
        debugShowCheckedModeBanner: debugDisableShadows,
        routes: routes,
        // showPerformanceOverlay: true,
        // showSemanticsDebugger: true,
      ),
    );
  }
}
