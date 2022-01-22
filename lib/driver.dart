import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'driver_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'updated.dart';
import 'deleted.dart';
class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}
class _DriverState extends State<Driver> {
  TextEditingController Did = TextEditingController();
  TextEditingController Dname = TextEditingController();
  TextEditingController Age = TextEditingController();
  Future adddriver() async{
  if(Did.text == ""||Dname.text == ""||Age.text == "")
  {
  Fluttertoast.showToast(
  msg:"The fields can't be blank ",
  toastLength: Toast.LENGTH_SHORT,
  gravity:ToastGravity.CENTER,
  fontSize:16.0,
  );
  }
  else{
  var url =Uri.parse('http://localhost/localconnect/Driver.php');var response = await http.post(url,body:{
  "Did":Did.text,
  "Dname":Dname.text,
  "Age":Age.text,
  });
  var data =response.body;
  print(data);
  if(data == "success"){
  Fluttertoast.showToast(msg: "Success!",
  toastLength:Toast.LENGTH_LONG,
  gravity: ToastGravity.CENTER,
  fontSize: 16.0,
  );
  }
  else{
  print(data);
  Fluttertoast.showToast(msg: "Failure!",
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
      floatingActionButton:  SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        backgroundColor: Colors.black,
        children: [
          SpeedDialChild(
            onTap: (){
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return  const updateDriver();
                }));
              });
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.update),
            label: 'Update',
          ),
          SpeedDialChild(
              backgroundColor: Colors.green,
            child: Icon(Icons.delete),
            onTap: (){
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return  const deleteDriver();
                }));
              });
            },
            label: 'delete',
          )
        ],
      ),
      appBar:AppBar(
        title:const Center(child: Text("Driver",        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: const Color(0xFF303030),
        child: Column(
          children: [
            const SizedBox(height:30),
            const Text('Enter the Details',
              style:TextStyle(
                color:Colors.white,
                fontFamily: 'Roboto',
                fontWeight:FontWeight.w700,
                fontSize: 30,
              ),
            ),
            const SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                controller: Did,
                style:const TextStyle(
                  color:Colors.white,
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:'Enter Driver id',
                  hintStyle: TextStyle(
                    fontStyle:FontStyle.italic,
                    color:Colors.white,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                controller: Dname,
                style:const TextStyle(
                  color:Colors.white,
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:"Enter Driver's name",
                  hintStyle: TextStyle(
                    fontStyle:FontStyle.italic,
                    color:Colors.white,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height:50),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                controller: Age,
                style:const TextStyle(
                  color:Colors.white,
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:"Enter Driver's Age",
                  hintStyle: TextStyle(
                    fontStyle:FontStyle.italic,
                    color:Colors.white,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height:50),
            Material(
              elevation:5.0,
              color:Colors.blueAccent,
              borderRadius:BorderRadius.circular(30.0),
              child:MaterialButton(
                onPressed:(){
                  setState(() {
                    adddriver();
                  });
                },
                minWidth:620,
                height:60.0,
                child:const Text(
                  'Insert Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height:50),
            Material(
              elevation:5.0,
              color:Colors.blueAccent,
              borderRadius:BorderRadius.circular(30.0),
              child:MaterialButton(
                onPressed:(){
                  setState(() {
                    Navigator.push(context,MaterialPageRoute(builder:(context){
                      return  MyApp();
                    }));
                  });
                },
                minWidth:620,
                height:60.0,
                child:const Text(
                  'View Table',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}