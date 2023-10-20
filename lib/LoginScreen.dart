import 'package:bankingproject/HomeScreen.dart';
import 'package:bankingproject/LoginConformScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _pin = TextEditingController();
  TextEditingController _conformpin = TextEditingController();

  var formkey = GlobalKey<FormState>();

  var pin = "";
  var conformpin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN SCREEAN"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text("PIN",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: new InputDecoration(
                  labelText: "ENTER PIN",
                  fillColor: Colors.green,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                controller: _pin,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "CONFORM PIN",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: new InputDecoration(
                  labelText: "ENTER CONFORM PIN",
                  fillColor: Colors.blue,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                controller: _conformpin,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: () async{
                    pin = _pin.text.toString();
                    conformpin = _conformpin.text.toString();

                    if (pin == "") {
                      var snackBar = SnackBar(
                        content: Text(
                          'please enter pin',
                          style: TextStyle(color: Colors.black),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.black,
                          onPressed: () {
                            print("Undo");
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (conformpin == "") {
                      var snackBar = SnackBar(
                        content: Text(
                          'please enter conform pin',
                          style: TextStyle(color: Colors.black),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.black,
                          onPressed: () {
                            print("Undo");
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if(pin == conformpin)
                    {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setString("islogin","yes");
                      pref.setString("pin", pin);

                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> HomeScreen())
                      );
                    }
                    else
                      {
                        var snackBar = SnackBar(
                          content: Text(
                            'Pin not match',
                            style: TextStyle(color: Colors.black),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          action: SnackBarAction(
                            label: 'Undo',
                            textColor: Colors.black,
                            onPressed: () {
                              print("Undo");
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                  },
                  child: Text("PROCEESED")),
            ],
          ),
        ),
      ),
    );
  }
}
