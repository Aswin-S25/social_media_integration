import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_integration/screen/signUp.dart';
import 'package:social_media_integration/services/firebase_services.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yolana",
          style: TextStyle(
            color: Color.fromARGB(255, 18, 255, 239),
            fontSize: 29,
            fontWeight: FontWeight.bold,
            fontFamily: 'PoppinsBold',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 155, 113, 215),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 192, 244, 233),
        padding: EdgeInsets.only(top: 60),
        child: Container(

          margin: EdgeInsets.only(left: 30, right: 30, bottom: 160),
          decoration: BoxDecoration(color: Color.fromARGB(182, 255, 255, 255),borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Color.fromARGB(30, 0, 0, 0), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 2))]),
          padding: EdgeInsets.only(top: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("PROFILE",
                      style: TextStyle(
                          color: Color.fromARGB(255, 155, 113, 215),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'PoppinsLight',
                          height: 1.5),
                      textAlign: TextAlign.center),
                const SizedBox(height: 70),  
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "${FirebaseAuth.instance.currentUser!.photoURL}"), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("${FirebaseAuth.instance.currentUser?.displayName}",style: TextStyle(fontSize: 30, fontFamily: 'PoppinsRegular'),),
                const SizedBox(
                  height: 30,
                ),
                Text("${FirebaseAuth.instance.currentUser?.email}",style: TextStyle(fontSize: 15, fontFamily: 'PoppinsRegular'),),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Firebaseservices().signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(
                      context
                    );
                  },
                  child: Text("Logout"),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 155, 113, 215))),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
