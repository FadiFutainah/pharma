import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Common/routes.dart';
import 'Common/themes.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'Providers/CartProvider.dart';

void main() {
  runApp(MyApp());
}

class Authorize {
  static Future<bool> isAdmin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.get('ADMIN') != null;
  }

  static Future<bool> isAuthenticated() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.get('USER') != null;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool auth;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        home: AnimatedSplashScreen(
          duration: 500,
          splash: Image.asset(
            'images/animatedSplash.gif',
          ),
          splashIconSize: 150,
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          pageTransitionType: PageTransitionType.fade,
        ),
        theme: primaryTheme,
        debugShowCheckedModeBanner: debugDisableShadows,
        routes: routes,
        //showPerformanceOverlay: true,
        // showSemanticsDebugger: true,
      ),
    );
  }
}
