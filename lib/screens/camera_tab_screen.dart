import 'package:flutter/material.dart';

import '/colors.dart';

class CameraTab extends StatefulWidget {
  const CameraTab({Key? key}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Camera", style: TextStyle(fontSize: 22, color: mainFontColor, fontWeight: FontWeight.bold,),)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Card(
                color: ashColor,
                child: SizedBox(
                  width: 350,
                  height: 400,
                  child: Center(
                    child: Icon(Icons.add, size: 200, color: mainFontColor,),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      debugPrint('Card tapped.');
                    },
                    child: Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        color: mainBGColor30,
                        border: Border.all(color: mainBGColor, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.more_horiz,color: mainFontColor),
                          Text("More", style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.bold,),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      debugPrint('Card tapped.');
                    },
                    child: Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: mainBGColor30,
                        border: Border.all(color: mainBGColor, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.camera_alt_outlined, size: 40, color: mainFontColor,),
                          Text("Capture", style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.bold,),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      debugPrint('Card tapped.');
                    },
                    child: Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        color: mainBGColor30,
                        border: Border.all(color: mainBGColor, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.photo_library_outlined, color: mainFontColor),
                          Text("Gallery", style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.bold,),)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
