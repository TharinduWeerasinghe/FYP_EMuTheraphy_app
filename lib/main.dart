import '/screens/login_page.dart';
import 'screens/register_page.dart';

import 'screens/get_started_page.dart';
import 'package:emutherapy/screens/home_page.dart';

import 'screens/landing_page.dart';

import 'screens/contact_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context){
              return ContactList();
            }
          ));
        },
      ),
    );
  }
}

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
          leading: IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Color(0xFFDE5D4D),
            ),
            onPressed: () => {
            },
          ),
        ),
        body: Container(
          color: Color(0xFFF5D19B),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Color(0xFFDE5D4D),
          onPressed: (){},
        ),
      ),
    );
  }
}

