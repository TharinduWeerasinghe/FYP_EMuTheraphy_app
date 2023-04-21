import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '/colors.dart';
import '/screens/pages/emo_result_page.dart';

class CameraTab extends StatefulWidget {
  const CameraTab({Key? key}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
        print(e);
    }

  }

  Future getImage() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

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
              Card(
                color: ashColor,
                child: SizedBox(
                  width: 350,
                  height: 400,
                  child: Center(
                    child: image != null
                        ? Image.file(
                            image!,
                            width: 300,
                            height: 300,
                          )
                        :Icon(Icons.add, size: 200, color: mainFontColor,),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmotionResultPage()),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        color: mainBGColor30,
                        border: Border.all(color: mainBGColor, width: 3),
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.emoji_emotions,color: mainFontColor),
                          Text("Emotion", style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.bold,),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: getImage,
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
                    onTap: pickImage,
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
