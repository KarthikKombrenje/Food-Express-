import 'package:flutter/material.dart';
import 'mainpg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
class login1 extends StatefulWidget {
  @override
  _login1State createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future  login() async{

    if(username.text == ""||password.text == "")
      {
        Fluttertoast.showToast(msg: "Both fields cant be blank!",
            toastLength:Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
        );
      }
    else{
        var url =Uri.parse('http://localhost/localconnect/login.php');
        var response = await http.post(url,
            body:{
        "username":username.text,
        "password":password.text,
        });
        print(response.body);
        print(username.text);
        print(password.text);
        var data = response.body;
       if(data == "success"){
        Navigator.push(context,MaterialPageRoute(builder:(context){
       return  mainpage();
        }));
        }
       else{
        Fluttertoast.showToast(msg: "The user already exists!",
        toastLength:Toast.LENGTH_SHORT,
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
                                        'Login',
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
                                      controller: username,
                                      autofocus: true,
                                    //  onChanged:(value){
                                        //Username= value;
                                      //  print(Username);
                                    //  },
                                      textAlign: TextAlign.center,
                                      cursorColor: Color(0xFFC41A38),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText:'Enter username',
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
                                      controller:password,
                                      //onChanged:(value){
                                       // Password = value;
                                      //  print(Password);
                                    //  },
                                      autofocus:true,
                                      textAlign: TextAlign.center,
                                      obscureText: true,
                                      cursorColor: const Color(0xFFC41A38),
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
                                            setState((){
                                              login();
                                            });
                                          },
                                          minWidth:620,
                                          height:60.0,
                                          child:const Text(
                                            'Log In',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                  ),
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
