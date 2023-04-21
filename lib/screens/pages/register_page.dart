import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '/main.dart';
import '/colors.dart';

class RegisterPage extends StatefulWidget {

  final Function() onClickLogIn;

  const RegisterPage({
    Key? key,
    required this.onClickLogIn,

  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBGColor,
      appBar: AppBar(
        title: const Center(child: Text("Register as a User")),
        backgroundColor: mainBGColor,
      ),
      body: SingleChildScrollView(
        child:  Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Form(
            key: formKey,
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
                  controller: emailController,
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
                  validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter valid e-mail'
                        : null,
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
                  controller: passwordController,
                  obscureText: true,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min 6 characters'
                      : null,
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
                    onPressed: registerUser,
                    child: const Text("Register")
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                        text: 'Already have an account?   ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = widget.onClickLogIn,
                            text: 'Log In',
                            style: const TextStyle(
                              color: mainFontColor,
                            ),
                          )
                        ]
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registerUser() async{

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center( child: CircularProgressIndicator(),)
    );

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch (e){
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);

  }
}
