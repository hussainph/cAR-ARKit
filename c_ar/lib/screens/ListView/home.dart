import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:c_ar/screens/ListView/components/main_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainPage(),


    );
  }
}