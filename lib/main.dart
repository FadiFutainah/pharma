import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'Common/routes.dart';
import 'Common/themes.dart';
import 'Providers/CartProvider.dart';
import 'View/Routes/RoutingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
        Provider(create: (context) => Cart()),
      ],
      child: GetMaterialApp(
        home: AnimatedSplashScreen(
          duration: 20,
          splash: Image.asset(
            'images/Intro.png',
          ),
          splashIconSize: 150,
          // splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          pageTransitionType: PageTransitionType.fade,
          // nextScreen: RoutingPage(),
          nextScreen: RoutingPage(),
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
