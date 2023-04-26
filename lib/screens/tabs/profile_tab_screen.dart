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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
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
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            ClipOval(
              child: Image.network(user.pImageUrl,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
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
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Gender", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(user.gender, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Age", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: mainFontColor),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(user.age, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: mainFontColor),),

                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainBGColor, // background color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person_off_outlined, color: mainFontColor),
                  SizedBox(width: 10),
                  Text(
                    'Log Out',
                    style: TextStyle(fontSize: 18, color: mainFontColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );

  }

}
