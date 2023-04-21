import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Align(
                  //alignment: Alignment.topCenter,
                  child: Text("Profile", style: TextStyle(fontSize: 22, color: mainFontColor, fontWeight: FontWeight.bold,),)
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.white,
              child: SizedBox(
                height: 600,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Icon(Icons.photo_camera_front_sharp, size: 50,),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Text(
                      "User Sample Name",
                      style: TextStyle(
                        fontSize: 16,
                        color: mainFontColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 14, color: mainFontColor, fontWeight: FontWeight.w500,),
                          ),
                          Text(
                            "test@gmail.com",
                            style: TextStyle(fontSize: 16, color: mainFontColor, fontWeight: FontWeight.w600,),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "User Sample Name",
                            style: TextStyle(
                              fontSize: 12,
                              color: mainFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "User Sample Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: mainFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 2.5, color: mainFontColor),
                          foregroundColor: mainFontColor,
                          backgroundColor: mainBGColor,
                          elevation: 0,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, MediaQuery.of(context).size.width * 0.1),
                        ),
                        onPressed: (){
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text("Log Out", style: TextStyle(fontWeight: FontWeight.w700),)
                    )
            ],
          ),
        ),
      )

      ],
        ),
      ),
    );
  }
}
