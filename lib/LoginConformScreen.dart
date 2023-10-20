import 'package:bankingproject/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginConformScreen extends StatefulWidget {
  const LoginConformScreen({Key? key}) : super(key: key);

  @override
  State<LoginConformScreen> createState() => _LoginConformScreenState();
}

class _LoginConformScreenState extends State<LoginConformScreen> {
  TextEditingController _pin =TextEditingController();

  var formkey = GlobalKey<FormState>();

  var pin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN CONFORM SCREEN"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key:  formkey,
          child: Column(
            children: [
              Text("PIN",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w900,color: Colors.black),),
              SizedBox(height: 10.0,),
              TextField(
                decoration: new InputDecoration(
                  labelText: "ENTER PIN",
                  fillColor: Colors.blue,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                controller: _pin,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(onPressed: () async{
                pin = _pin.text.toString();

                SharedPreferences prefs = await SharedPreferences.getInstance();
                var cpin = prefs.getString("pin").toString();

                if(pin == "")
                  {
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
                  }
                else if(pin==cpin)
                  {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),),
                    );
                  }
                else
                  {
                    var snackBar = SnackBar(
                      content: Text(
                        'pin not match',
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
                  child: Text("PROCESES")),
            ],
          ),
        ),
      ),
    );
  }
}
