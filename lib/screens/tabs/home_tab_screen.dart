import 'dart:async';
import '/colors.dart';
import 'package:flutter/material.dart';

import '/screens/pages/home_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  late Timer _timer;
  int _imageIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/happy_img.png',
    'assets/images/sad_img.png',
    'assets/images/enjoy_img.png',
    'assets/images/neutral_img.png'
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _imageIndex = (_imageIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  void dispose(){;
    _timer.cancel(); // dispose of the Timer object
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  HomePage.of(context)?.onTabTapped(1);
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    child: SizedBox(
                        width: 375.0,
                        height: 250.0,
                        child: Column(
                          children: [
                            const Text("How Do You Feel Today ? ", style: TextStyle(fontSize: 20, color: mainFontColor, fontWeight: FontWeight.bold),),
                            Image.asset(_imagePaths[_imageIndex], width: 200, height: 200,),
                            const Text("Capture Image", style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.bold),)
                          ],
                        )
                    )
                )
            ),
          ),
          Card(

          )
        ],
      ),
    );
  }
}


