import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'main.dart';


class MyLogin extends StatefulWidget{
  @override
  _MyLoginPage createState() => new _MyLoginPage();
}

class _MyLoginPage extends State<MyLogin>{
  final _formKey = GlobalKey<FormState>();
  



  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.cyan,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(45.0, 55.0, 0.0, 0.0),
                        child: Text(
                            'Pawsibilities',
                            style: TextStyle(fontSize: 60.0,fontFamily: "Smile", fontWeight: FontWeight.bold)
                        )
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(140.0, 150.0, 130.0, 0.0),
                        child: Image.asset('assets/download.png')
                    ),
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Username needed!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                        ),
                      validator: (value)
                        {
                          if(value.isEmpty){
                            return 'Password Needed!';
                        }
                          return null;
                        },
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0,0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => new CupertinoAlertDialog(
                              title: Text("Enter Email"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Send"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }
                                )
                              ],
                              content: CupertinoTextField(
                                placeholder: "Email",
                              )
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.cyanAccent,
                        color: Colors.cyan,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            if(_formKey.currentState.validate())
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Login with Facebook', style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              ),
              SizedBox(height:15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Looking for Pawsibilites?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )
                    )
                  )
                ],
              )
            ]
          ),
        ),
      ),


    );


  }

}