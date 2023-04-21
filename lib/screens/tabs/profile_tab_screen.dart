import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/colors.dart';
import '/model/user.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  final userLogedIn = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text("Profile", style: TextStyle(fontSize: 22, color: mainFontColor, fontWeight: FontWeight.bold,),)
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder<UserData?>(
              future: getUser(),
              builder: (context, snapshot){
                if (snapshot.hasError){
                  return Text('Something went ${snapshot.error}');
                } else if (snapshot.hasData){
                  final user = snapshot.data;

                  return user == null
                      ? const Center(child: Text("No User"),)
                      : buildUser(user);
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }

              },
            ),
          ),
        ],
      ),
    );
  }

  Future<UserData?> getUser()  async {
    final userDetails = FirebaseFirestore.instance.collection('users').doc(userLogedIn?.email!);
    debugPrint(userLogedIn?.email!);
    final snapshot = await userDetails.get();

    if (snapshot.exists) {
      return UserData.fromJson(snapshot.data()!);
    }
    //return null;
  }

  Widget buildUser(UserData user){
    return Container(
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        //color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.network(user.pImageUrl,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                //color: mainBGColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(user.id, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: mainFontColor),),

                ],
              ),
            ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: mainBGColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(user.id, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: mainFontColor),),
                  Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(user.id, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: mainFontColor),),

                ],
              ),
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
    );

  }

}
