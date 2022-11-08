import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_integration/screen/signUp.dart';
import 'package:social_media_integration/services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Text("${FirebaseAuth.instance.currentUser?.displayName}"),
            const SizedBox(
              height: 30,
            ),
            Text("${FirebaseAuth.instance.currentUser?.email}"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await Firebaseservices().signOut();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
