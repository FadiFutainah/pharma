import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

Future<void> initRole(BuildContext context) async {
  try {
    SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance().timeout(Duration(seconds: 30));
    if (Provider.of<AuthProvider>(context).isAuthenticated) {
      sharedPreferences.setString('role', 'ADMIN');
      String role = sharedPreferences.get('role');
      if (role != null && role == 'ADMIN') {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AdminHomePage.id, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomePage.id, (route) => false);
      }
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AdminHomePage.id, (route) => false);
    }
  } on Exception {
    Get.offAll(HomePage());
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initRole(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Color(0xffffb52d)),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initRole(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: GetMaterialApp(
        home: AnimatedSplashScreen(
          duration: 500,
          splash: Image.asset(
            'images/Intro.png',
          ),
          splashIconSize: 150,
          nextScreen: LoadingScreen(),
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
