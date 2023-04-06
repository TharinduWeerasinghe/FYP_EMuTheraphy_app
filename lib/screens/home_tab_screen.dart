import '/colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBGColor,
      appBar: AppBar(
        title: const Text("EMuTherapy", style: TextStyle(fontSize: 26, color: mainFontColor, fontWeight: FontWeight.bold,),),
        backgroundColor: secondBGColor,
        elevation: 0,
      ),
      body:  Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                        Image.asset('assets/images/sad_img.png', width: 200, height: 200,),
                        Text("Capture Image")
                      ],
                  )
                )
              )
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("Item One"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                title: Text("Item One"),
                ),
          ],
          )
      )
    ]),
    );
  }
}
