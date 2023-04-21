import 'package:flutter/material.dart';

import '/colors.dart';

class ContactTab extends StatelessWidget {
  const ContactTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Contact Details", style: TextStyle(fontSize: 22,
                      color: mainFontColor,
                      fontWeight: FontWeight.bold,),)
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Music Therapist Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Dr. Ajith Kumara',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Contact Number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+94 71 421 2378',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'E-Mail',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'ajithkumara@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Developer Details", style: TextStyle(fontSize: 22,
                      color: mainFontColor,
                      fontWeight: FontWeight.bold,),)
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Tharindu Weerasinghe',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Contact Number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+94 76 866 0292',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'E-Mail',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'tharindu.2019087@iit.ac.lk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mainFontColor),
              ),
    ]
        ),
      ),
    );

  }
}
