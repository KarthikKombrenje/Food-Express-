import 'dart:html';
import 'package:food_clg/review.dart';
import 'customer.dart';
import 'orderdetails.dart';
import 'package:flutter/material.dart';
import 'driver.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'restaurant.dart';
import 'food.dart';
import 'main.dart';
class mainpage extends StatefulWidget {

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar:AppBar(
        title:const Center(child: Text("Food express",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        ),

        ),
            backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView (
        child: Container(
          height:height,
              decoration:const BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('image/foood.jpg'),
                   fit : BoxFit.cover,
                ),
              ),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:[
                         Padding(
                           padding: const EdgeInsets.all(40.0),
                           child: Container(
                             child: FlatButton(
                               onPressed: () {
                                 Navigator.push(context,MaterialPageRoute(builder:(context){
                                   return  const Login();
                                 }));
                               },
                               color: Colors.black45,
                               child: const Text('    LogOut     ',
                                 style: TextStyle(
                                   color:Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 20,
                                 ),
                               ),
                               padding: const EdgeInsets.all(40),
                             ),
                           ),
                         ),
                       ]
                     ),
                     const SizedBox(height:30),
                     Row(
                         children:[
                           const SizedBox(height:100,width:150),
                           Expanded(
                             flex:15,
                           child: Container(
                             child: FlatButton(
                               onPressed: () {
                                 Navigator.push(context,MaterialPageRoute(builder:(context){
                                   return  const Driver();
                                 }));
                               },
                               color: Colors.black54,
                               child: const Text('Drivers      ',
                                 style: TextStyle(
                                   color:Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 20,
                                 ),
                               ),
                               padding: const EdgeInsets.all(40),
                             ),
                           ),
                           ),
                           const SizedBox(width:50,height:20),
                          Expanded(
                            flex:15,
                            child: Container(
                            child:FlatButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder:(context){
                                  return  const Customer();
                                }));
                              },
                              color: Colors.black54,
                              child: const Text('Customer',
                                style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              padding: const EdgeInsets.all(40),
                            ),
                            ),
                          ),
                           const SizedBox(width:50,height:20),
                           Expanded(
                             flex:15,
                             child: Container(
                               child: FlatButton(
                                 onPressed: () {
                                   Navigator.push(context,MaterialPageRoute(builder:(context){
                                     return  const Restaurant();
                                   }));
                                 },
                                 color: Colors.black54,
                                 child: const Text('Restaurant',
                                   style: TextStyle(
                                     color:Colors.white,
                                     fontWeight: FontWeight.w500,
                                     fontSize: 20,
                                   ),
                                 ),
                                 padding: const EdgeInsets.all(40),
                               ),
                             ),
                           ),
                           const SizedBox(width:50,height:20),
                         ]
                     ),
                    const SizedBox(height:50),
                    Row(
                      children:[
                        const SizedBox(height:100,width:150),
                        Expanded(
                          flex:10,
                        child:Container(
                          child:FlatButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return  const Food();
                              }));
                            },
                            color: Colors.black54,
                            child: const Text('Food       ',
                              style: TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            padding: const EdgeInsets.all(40),
                          )
                        ),
                        ),
                        const SizedBox(width:50,height:20),
                        Expanded(
                          flex:10,
                          child: Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder:(context){
                                  return  const Review();
                                }));
                              },
                              color: Colors.black54,
                              child: const Text('Reviews       ',
                                style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              padding: const EdgeInsets.all(40),
                            ),
                          ),
                        ),
                        const SizedBox(width:50,height:20),
                       Expanded(
    flex:10,
                       child: Container(
                          child:  FlatButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return  const Orders();
                              }));
                            },
                            color: Colors.black54,
                            child: const Text('Order Details',
                              style: TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            padding: const EdgeInsets.all(40),
                          ),
                        ),
                          ),
                        const SizedBox(width:50,height:20),
                      ]
                    )
                   ],
                 ),
            ),
      ),
    );
  }
}
