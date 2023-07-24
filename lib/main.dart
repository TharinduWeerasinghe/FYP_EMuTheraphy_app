import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import '/screens/pages/login_page.dart';
import 'screens/pages/home_page.dart';

import '/screens/pages/home_page.dart';
import 'screens/pages/auth_page.dart';
import 'utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // home: HomePage(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState){
            return const Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError){
            return const Center(child: Text("Something went wrong.."),);
          } else if (snapshot.hasData){
            return const HomePage();
          }else{
            return const AuthPage();
          }
        }
      ),
    );
  }
}