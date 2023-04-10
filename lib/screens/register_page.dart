import 'package:emutherapy/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBGColor,
      appBar: AppBar(
        title: Text("Register a User"),
        backgroundColor: mainBGColor,
      ),
      body: SingleChildScrollView(
        child:  Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: mainFontColor,),
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: mainFontColor,),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month, color: mainFontColor,),
                    hintText: "Age",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.local_activity_outlined, color: mainFontColor,),
                    hintText: "Job",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.emoji_people, color: mainFontColor,),
                    hintText: "Gender",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded, color: mainFontColor,),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: mainFontColor,
                      fontStyle: FontStyle.italic,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkOrangeColor),
                    ),
                  ),
                  onChanged: (value){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: mainFontColor,
                      backgroundColor: mainBGColor,
                      elevation: 0,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.7, MediaQuery.of(context).size.width * 0.14),
                    ),
                    onPressed: (){
                      debugPrint("Reg");
                    },
                    child: const Text("Register")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
