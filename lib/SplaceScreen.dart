import 'package:bankingproject/LoginConformScreen.dart';
import 'package:bankingproject/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {

  cheklogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("islogin")) {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginConformScreen())
      );
    }
    else {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginScreen())
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      cheklogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPLACE SCREEN"),
      ),
      body: Center(
        child: Text("logo"),
      ),
    );
  }
}
