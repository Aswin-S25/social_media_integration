import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:social_media_integration/screen/home.dart';
import 'package:social_media_integration/screen/home2.dart';
import 'package:social_media_integration/services/firebase_services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 244, 233),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Color.fromARGB(255, 155, 113, 215),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/register.gif"))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              const Text("Yolana",
                  style: TextStyle(
                      color: Color.fromARGB(255, 18, 255, 239),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      height: 1.5),
                  textAlign: TextAlign.center),
              SizedBox(height: MediaQuery.of(context).size.width * 0.7),
              const SizedBox(
                height: 80,
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  await Firebaseservices().sigInWithGoogle();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                padding: const EdgeInsets.only(top: 15, bottom: 15),
              ),
              const SizedBox(height: 10),
              SignInButtonBuilder(
                icon: Icons.facebook,
                iconColor: Colors.blue,
                text: "Sign up with facebook",
                textColor: const Color.fromARGB(255, 132, 132, 132),
                splashColor: const Color.fromARGB(255, 192, 244, 233),
                onPressed: () {
                  signInWithFacebook();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  HomeScreen2()));
                },
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                backgroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
