import 'dart:async';

import '/colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  int _imageIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/happy_img.png',
    'assets/images/sad_img.png',
    'assets/images/happy_s_img.png'
  ];

  @override
  void initState() {
    super.initState();

    // Start a timer to change the image displayed every 2 seconds
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _imageIndex = (_imageIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Wrap(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text("EMuTherapy", style: TextStyle(fontSize: 26, color: mainFontColor, fontWeight: FontWeight.bold,),)
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      child: SizedBox(
                          width: 375.0,
                          height: 250.0,
                          child: Column(
                            children: [
                              Text("How Do You Feel Today ? ", style: TextStyle(fontSize: 18, color: mainFontColor, fontWeight: FontWeight.bold),),
                              Image.asset(_imagePaths[_imageIndex], width: 200, height: 200,),
                              Text("Capture Image")
                            ],
                          )
                      )
                  )
              ),
            ),
            Card(
                margin: const EdgeInsets.all(10.0),
                color: secondBGColor,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child:Text("Last Played", style: TextStyle(fontSize: 18, color: mainFontColor, fontWeight: FontWeight.bold),)
                      ),
                    ),
                    ListTile(
                      leading: Image.asset('assets/images/testimg.jpg', width: 25, height: 25),
                      title: Text("Item One"),
                      subtitle: Text("Artist"),
                      trailing: Icon(Icons.play_circle_outline_outlined),
                      onTap: (){},
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListTile(
                      leading: Image.asset('assets/images/testimg.jpg', width: 25, height: 25),
                      title: Text("Item One"),
                      subtitle: Text("Artist"),
                      trailing: Icon(Icons.play_circle_outline_outlined),
                      onTap: (){},
                    )
                  ],
                )
            )
          ],
        )
      ],
    );
  }
}


