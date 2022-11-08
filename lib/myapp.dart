import 'package:flutter/material.dart';
import 'package:social_media_integration/screen/signUp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: "TOLOTO",
      home: Scaffold(
        body: Register(),
        
      ),
    );
  }
}