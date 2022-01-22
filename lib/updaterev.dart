import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'review_view.dart';
class updateDriver extends StatefulWidget {
  const updateDriver({Key? key}) : super(key: key);
  @override
  _updateDriverState createState() => _updateDriverState();
}

class _updateDriverState extends State<updateDriver> {
  TextEditingController upd = TextEditingController();

  Future updatedriver() async{
    if(upd.text == "")
    {
      Fluttertoast.showToast(
        msg:"The field can't be blank ",
        toastLength: Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER,
        fontSize:16.0,
      );
    }
    else{
      var url =Uri.parse('http://localhost/localconnect/update.php');var response = await http.post(url,body:{
        "upd":upd.text,
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
      backgroundColor: const Color(0xFF303030),
      appBar:AppBar(
        title:const Center(child: Text("Update Review",style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),)),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child:Center(
            child:Column(
              children:  [
                const SizedBox(height:50),
                const Text('Write the query to update the Review table',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height:50),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: upd,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: const Color(0xFFC41A38),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText:'Enter update Query ',
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
                const SizedBox(height: 50),
                Material(
                  elevation:5.0,
                  color:Colors.green,
                  borderRadius:BorderRadius.circular(30.0),
                  child:MaterialButton(
                    onPressed:(){
                      setState(() {
                        updatedriver();
                      });
                    },
                    minWidth:620,
                    height:60.0,
                    child:const Text(
                      'Update Table',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Material(
                  elevation:5.0,
                  color:Colors.green,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
