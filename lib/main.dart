import 'package:flutter/material.dart';
import 'login1.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'mainpg.dart';
bool signin = true;
bool processing = false;
void main() {
  return runApp(
       const MaterialApp(
      home: Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String Username;
  late String Password;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future register() async{
    if(username.text == ""||password.text == "")
      {
        Fluttertoast.showToast(
          msg:"Both the fields can't be blank ",
          toastLength: Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER,
          fontSize:16.0,
        );
      }
    else{
      var url =Uri.parse('http://localhost/localconnect/register.php');
      var response = await http.post(url,body:{
        "username":username.text,
        "password":password.text,
      });
    var data =response.body;
    if(data == "success"){
      Navigator.push(context,MaterialPageRoute(builder:(context){
        return  mainpage();
      }));
    }
    else{
    Fluttertoast.showToast(msg: "The user and Password already used!",
    toastLength:Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    fontSize: 16.0,
    );
    }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child: Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Expanded(
                  flex:2,
                  child: Container(
                      width:1,
                      color:Colors.white,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:   [
                          const Image(
                            image: AssetImage('image/foodexpress2.jpg'),
                          ),
                          const SizedBox(height:5),
                          const Text(
                              'Food Express',
                              textDirection: TextDirection.ltr,
                              style:TextStyle(
                                decoration: TextDecoration.none,
                                fontSize:40,
                                color:Colors.red,
                                fontFamily: 'Roboto',
                                fontWeight:FontWeight.w700,
                              )
                          ),
                          const SizedBox(height:30),
                          Expanded(
                            child: Container(
                              color:Colors.grey[200],
                              child: Column(
                                children:  [
                                  const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                        'Register',
                                        textDirection: TextDirection.ltr,
                                        style:TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize:25,
                                          fontFamily: 'Roboto',
                                          color:Colors.redAccent,
                                          fontWeight:FontWeight.w700,
                                        )
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(left:25.0,right:25.0),
                                    child: TextField(
                                      controller:username,
                                      autofocus: true,
                                      textAlign: TextAlign.center,
                                     // onChanged:(value){
                                      //  Username = value;
                                       // print(Username);
                                      //},
                                      cursorColor: Color(0xFFC41A38),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText:'Enter your email',
                                        hintStyle: TextStyle(
                                          fontStyle:FontStyle.italic,
                                          color:Color(0xFF1B1F32),
                                        ),

                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height:20),
                                  Padding(
                                    padding: const EdgeInsets.only(left:25.0,right:25.0),
                                    child: TextField(
                                      autofocus:true,
                                      controller:password,
                                   //   onChanged:(value){
                                       // Password = value;
                                    //    print(Password);
                                    //  },
                                      textAlign: TextAlign.center,
                                      obscureText: true,
                                      cursorColor: Color(0xFFC41A38),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(

                                        hintText:'Enter Password',
                                        hintStyle: TextStyle(
                                          fontStyle:FontStyle.italic,
                                          color:Color(0xFF1B1F32),
                                        ),
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height:20),
                                  Material(
                                      elevation:5.0,
                                      color:Colors.blueAccent,
                                      borderRadius:BorderRadius.circular(30.0),
                                      child:MaterialButton(
                                          onPressed:(){
                                            setState(() {
                                              register();
                                            });
                                          },
                                          minWidth:620,
                                          height:60.0,
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                      )
                                  ),
                                  const SizedBox(height:20),
                                  Material(
                                      elevation:5.0,
                                      color:Colors.lightBlue,
                                      borderRadius:BorderRadius.circular(30.0),
                                      child:MaterialButton(
                                          onPressed:(){
                                            setState((){
                                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                                return  login1();
                                              }));
                                            });
                                          },
                                          minWidth:620,
                                          height:60.0,
                                          child:const Text(
                                            'Already a User ? Login here',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    width: 1,
                    decoration:  const BoxDecoration(
                        image:  DecorationImage(
                          image:  AssetImage('image/food1.jpg'),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                ),
              ]
          ),
        ),
      );
  }
}

