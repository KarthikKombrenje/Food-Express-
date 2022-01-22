import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'customer_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'updatedc.dart';
import 'deletec.dart';
class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  _CustomerState createState() => _CustomerState();
}
class _CustomerState extends State<Customer> {
  late String dropdownValue='Select Customer Type';
  TextEditingController Cid = TextEditingController();
  TextEditingController Cname = TextEditingController();
  TextEditingController Cadd = TextEditingController();
  var Ctype;
  Future addcustomer() async{
    if(Cid.text == ""||Cname.text == ""||Cadd.text == ""||Cadd.text == ""||Ctype == "Select Customer Type")
    {
      Fluttertoast.showToast(
        msg:"The fields can't be blank ",
        toastLength: Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER,
        fontSize:16.0,
      );
    }
    else{
      var url =Uri.parse('http://localhost/localconnect/customer.php');
      var response = await http.post(url,body:{
        "Cid":Cid.text,
        "Cname":Cname.text,
        "Cadd":Cadd.text,
        "Ctype":Ctype
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
            backgroundColor: Colors.red,
            child: Icon(Icons.update),
            label: 'Update',
            onTap: (){
              setState((){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return  const updateDriver();
                }));
              });
            }
          ),
          SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(Icons.delete),
            label: 'delete',
              onTap: (){
                setState((){
                  Navigator.push(context,MaterialPageRoute(builder:(context){
                    return  const deleteCustomer();
                  }));
                });
              }
          )
        ],
      ),
      appBar:AppBar(
        title:const Center(child: Text("Customer",        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),)),
        backgroundColor: Colors.blueAccent,
      ),
      body:
      Container(
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
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                controller: Cid,
                style:const TextStyle(
                  color:Colors.white,
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:'Customer Id',
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
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                style:const TextStyle(
                  color:Colors.white,
                ),
                controller: Cname,
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:'Enter Customer Name',
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
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child: TextField(
                style:const TextStyle(
                  color:Colors.white,
                ),
                controller: Cadd,
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Color(0xFFC41A38),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText:'Enter Customer Address',
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
            const SizedBox(height:20.0),
            Padding(
              padding: const EdgeInsets.only(left:25.0,right:25.0),
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                ),
                padding: const EdgeInsets.only(left:25.0,right:25.0),
                child: DropdownButton(
                  dropdownColor: const Color(0xFF303030),
                  hint: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Select Item Type",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style:const TextStyle(
                    fontStyle:FontStyle.italic,
                    color: Colors.white,
                  ),
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.black54,
                  ),
                  items: <String>['Select Customer Type','Regular Customer', 'Occasional Customer', 'New Customer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                        textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownValue = newvalue!;
                      Ctype = newvalue;
                      print(Ctype);
                    });
                  },
                ),
              )
            ),
            const SizedBox(height:50),
            Material(
              elevation:5.0,
              color:Colors.blueAccent,
              borderRadius:BorderRadius.circular(30.0),
              child:MaterialButton(
                onPressed:(){
                    setState(() {
                      addcustomer();
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
                    setState((){
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

